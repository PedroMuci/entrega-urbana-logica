% main.pl
% Arquivo principal do sistema especialista Entrega Urbana
% Estrutura de pastas: C:\entrega-urbana-logica\src
% Revisado para leitura correta de opcoes sem precisar de ponto final
% Autor: Pedro Muci

:- ['src/kb.pl',
    'src/rules.pl',
    'src/ui.pl',
    'src/explain.pl'].

% -------------------------------------------------------------
% start/0 - ponto de entrada principal
% -------------------------------------------------------------
start :-
    banner,
    menu.

banner :-
    format("~n=== Sistema - Entrega Urbana ===~n"),
    format("Objetivo: calcular o custo estimado de entrega considerando zona, pedagios, peso, volume e janela de entrega.~n~n").

% -------------------------------------------------------------
% menu/0 - exibe o menu principal e processa a opcao escolhida
% -------------------------------------------------------------
menu :-
    format("Menu:~n"),
    format("1) Calcular custo de entrega~n"),
    format("2) Sair~n"),
    format("> "),
    read_line_to_string(user_input, Input),   % Le uma linha completa como texto
    atom_number(Input, Opt),                  % Converte para numero
    process_option(Opt).

% -------------------------------------------------------------
% process_option/1 - executa a acao conforme a escolha
% -------------------------------------------------------------
process_option(1) :- !,
    run_case,
    cleanup,
    nl, menu.

process_option(2) :- !,
    format("Saindo do sistema...~n"),
    halt.   % <-- Encerra completamente o programa

process_option(_) :-
    format("Opcao invalida. Tente novamente.~n~n"),
    menu.

% -------------------------------------------------------------
% run_case/0 - executa o fluxo de calculo da entrega
% -------------------------------------------------------------
run_case :-
    coletar_observacoes,                 % Perguntas (ui.pl)
    ( meta(Result) ->                    % Calculo principal (rules.pl)
        explicar(Result),                % Explicacao detalhada (explain.pl)
        format("~nRESULTADO: ~w~n", [Result])
    ; format("~nNao foi possivel calcular o custo. Revise as entradas.~n")
    ),
    true.
