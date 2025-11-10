% explain.pl
% Exibe explicação detalhada do resultado final.

explicar(resultado(custo(Total), detalhamento(Zona, Peso, Volume, Ped, Janela, Comp, Tempo))) :-
    format("~n[Explicacao do Calculo]~n"),
    format("- Zona: ~w~n", [Zona]),
    format("- Peso (kg): ~w~n", [Peso]),
    format("- Volume (m3): ~w~n", [Volume]),
    format("- Pedagios: ~w~n", [Ped]),
    format("- Janela critica: ~w~n", [Janela]),
    nl, format("Componentes do custo:~n"),
    print_componentes(Comp),
    nl, format("Tempo estimado (h): ~2f~n", [Tempo]),
    format("TOTAL (R$): ~2f~n", [Total]),
    format("~nObservacao:~n- Soma dos componentes deve ser igual ao total.~n- Pesos e volumes nao podem ser negativos.~n").

print_componentes([]).
print_componentes([K-V|T]) :-
    format("  - ~w: R$ ~2f~n", [K, V]),
    print_componentes(T).
