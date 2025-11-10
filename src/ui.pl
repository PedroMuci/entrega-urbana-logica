% ui.pl
% Interface de entrada de dados para o sistema de Entrega Urbana
% Revisado para impedir entrada de numeros negativos
% Autor: Pedro Muci

:- dynamic obs/1.

% -------------------------------------------------------------
% coletar_observacoes/0
% -------------------------------------------------------------
coletar_observacoes :-
    format("~n-- Coleta de dados para Entrega Urbana --~n"),
    perguntar_zona,
    perguntar_numero("Peso da carga (kg): ", peso),
    perguntar_numero("Volume da carga (m3): ", volume),
    perguntar_numero_inteiro("Numero de pedagios: ", num_pedagios),
    perguntar_sim_nao("Janela critica (fora do horario normal)? (s/n): ", janela_critica),
    format("~nDados coletados com sucesso.~n").

% -------------------------------------------------------------
% perguntar_zona/0 - menu numerico de zonas
% -------------------------------------------------------------
perguntar_zona :-
    format("Selecione a zona de entrega:~n"),
    format("1) Centro~n"),
    format("2) Industrial~n"),
    format("3) Residencial~n"),
    format("4) Rural~n"),
    format("5) Cancelar e voltar ao menu~n"),
    format("> "),
    read_line_to_string(user_input, Input),
    atom_number(Input, Num),
    selecionar_zona(Num).

selecionar_zona(1) :- assertz(obs(zona(centro))).
selecionar_zona(2) :- assertz(obs(zona(industrial))).
selecionar_zona(3) :- assertz(obs(zona(residencial))).
selecionar_zona(4) :- assertz(obs(zona(rural))).
selecionar_zona(5) :-
    format("Operacao cancelada. Retornando ao menu principal...~n"),
    fail.
selecionar_zona(_) :-
    format("Opcao invalida. Tente novamente.~n"),
    perguntar_zona.

% -------------------------------------------------------------
% perguntar_numero/2 - aceita somente numeros >= 0
% -------------------------------------------------------------
perguntar_numero(Msg, Campo) :-
    format(Msg),
    read_line_to_string(user_input, Input),
    catch(atom_number(Input, Valor), _, fail),
    ( number(Valor), Valor >= 0 ->
        Term =.. [Campo, Valor],
        assertz(obs(Term))
    ; number(Valor), Valor < 0 ->
        format("O valor nao pode ser negativo. Tente novamente.~n"),
        perguntar_numero(Msg, Campo)
    ; format("Entrada invalida. Digite um numero.~n"),
      perguntar_numero(Msg, Campo)
    ).

% -------------------------------------------------------------
% perguntar_numero_inteiro/2 - aceita somente inteiros >= 0
% -------------------------------------------------------------
perguntar_numero_inteiro(Msg, Campo) :-
    format(Msg),
    read_line_to_string(user_input, Input),
    catch(atom_number(Input, Valor), _, fail),
    ( integer(Valor), Valor >= 0 ->
        Term =.. [Campo, Valor],
        assertz(obs(Term))
    ; integer(Valor), Valor < 0 ->
        format("O valor nao pode ser negativo. Tente novamente.~n"),
        perguntar_numero_inteiro(Msg, Campo)
    ; format("Entrada invalida. Digite um numero inteiro >= 0.~n"),
      perguntar_numero_inteiro(Msg, Campo)
    ).

% -------------------------------------------------------------
% perguntar_sim_nao/2 - pergunta padrao de sim ou nao
% -------------------------------------------------------------
perguntar_sim_nao(Msg, Campo) :-
    format(Msg),
    read_line_to_string(user_input, Ans0),
    string_lower(Ans0, Ans),
    ( Ans == "s" -> Term =.. [Campo, sim], assertz(obs(Term))
    ; Ans == "n" -> Term =.. [Campo, nao], assertz(obs(Term))
    ; format("Entrada invalida. Digite s ou n.~n"),
      perguntar_sim_nao(Msg, Campo)
    ).

% -------------------------------------------------------------
% cleanup/0 - limpa fatos anteriores
% -------------------------------------------------------------
cleanup :-
    retractall(obs(_)).
