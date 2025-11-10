% rules.pl
% Regras de inferencia e calculos do sistema de Entrega Urbana.
% Esta versao esta sem acentos e sem conflitos de nomes de predicados.
% Ultima revisao: 09/11/2025

:- dynamic obs/1.

% -------------------------------------------------------------
% meta/1 - calcula o resultado final da entrega
% -------------------------------------------------------------
% Gera um termo estruturado:
% resultado(custo(Total), detalhamento(Zona, Peso, Volume, NumPedagios, JanelaCritica, Componentes, TempoEstimado))
%
% - Zona: tipo de regiao (centro, industrial, etc)
% - Peso: em kg
% - Volume: em m3
% - NumPedagios: quantidade de pedagios
% - JanelaCritica: sim ou nao
% - Componentes: lista com cada parte do custo
% - TempoEstimado: em horas

meta(resultado(custo(Total), detalhamento(Zona, Peso, Volume, NumPedagios, JanelaCritica, Componentes, TempoEstimado))) :-

    % captura dados informados pelo usuario
    obs(zona(Zona)),
    obs(peso(Peso)),
    obs(volume(Volume)),
    obs(num_pedagios(NumPedagios)),
    ( obs(janela_critica(J)) -> JanelaCritica = J ; JanelaCritica = nao ),

    % validacoes basicas
    peso_valido(Peso),
    volume_valido(Volume),

    % calculos por componente
    custo_por_zona(Zona, CustoZona),
    custo_por_pedagios(NumPedagios, CustoPedagios),
    custo_por_peso(Peso, CustoPeso),
    custo_por_volume(Volume, CustoVolume),
    custo_extra_janela(JanelaCritica, CustoJanela),

    % lista de componentes individuais
    Componentes = [zona-CustoZona, pedagios-CustoPedagios, peso-CustoPeso, volume-CustoVolume, janela-CustoJanela],

    % soma todos os componentes
    sum_componentes(Componentes, SomaTotal),

    % arredonda para 2 casas decimais
    Total is round(SomaTotal * 100) / 100,

    % tempo medio estimado
    tempo_estimado(Zona, TempoEstimado).

% -------------------------------------------------------------
% Validacoes basicas
% -------------------------------------------------------------
peso_valido(P) :-
    number(P),
    P >= 0, !.
peso_valido(_) :-
    format("Erro: peso invalido. Deve ser um numero >= 0.~n"),
    fail.

volume_valido(V) :-
    number(V),
    V >= 0, !.
volume_valido(_) :-
    format("Erro: volume invalido. Deve ser um numero >= 0.~n"),
    fail.

% -------------------------------------------------------------
% Calculos de custo por componente
% -------------------------------------------------------------

% Custo base pela zona (definido em kb.pl)
custo_por_zona(Zona, Custo) :-
    ( preco_base(Zona, Custo) -> true
    ; format("Aviso: zona ~w desconhecida. Usando custo 0.~n", [Zona]),
      Custo = 0.0 ).

% Custo por pedagios (numero * valor unitario)
custo_por_pedagios(NumPedagios, Total) :-
    number(NumPedagios),
    NumPedagios >= 0,
    valor_pedagio(V),
    Total is NumPedagios * V.

% Custo adicional por peso
custo_por_peso(Peso, Custo) :-
    ( Peso =< 20 -> taxa_peso_por_kg(20, Taxa)
    ; Peso =< 500 -> taxa_peso_por_kg(500, Taxa)
    ; taxa_peso_por_kg(inf, Taxa) ),
    Custo is Peso * Taxa.

% Custo adicional por volume
custo_por_volume(Vol, Custo) :-
    ( Vol =< 0.5 -> taxa_volume_por_m3(0.5, Custo)
    ; Vol =< 2.0 -> taxa_volume_por_m3(2.0, Custo)
    ; taxa_volume_por_m3(inf, Custo) ).

% Custo extra se a janela for critica
custo_extra_janela(Janela, Custo) :-
    ( custo_janela_critica(Janela, Custo) -> true
    ; Custo = 0.0 ).

% Tempo medio estimado pela zona
tempo_estimado(Zona, Tempo) :-
    ( tempo_base(Zona, T) -> Tempo = T
    ; Tempo = 2.0 ).

% -------------------------------------------------------------
% Soma dos componentes (lista de pares)
% -------------------------------------------------------------
sum_componentes([], 0.0).
sum_componentes([_-V | T], S) :-
    sum_componentes(T, R),
    S is V + R.
