almacenar(Numero, Lista) :-
    integer(Numero),
    Absoluto is abs(Numero),
    separar(Absoluto, Lista).

separar(N, [N]) :-
    N < 10,
    !.
separar(N, [Ultimo|Demas]) :-
    N >= 10,
    Ultimo is N mod 10,
    Cociente is N // 10,
    separar(Cociente, Demas).

ejecutar :-
    write('Escribe un entero (termina con punto): '),
    read(Entrada),
    mostrar_resultado(Entrada).

mostrar_resultado(Entrada) :-
    almacenar(Entrada, Lista),
    !,
    format('Digitos almacenados: ~w~n', [Lista]).
mostrar_resultado(_) :-
    format('Valor no valido, se esperaba un entero.~n').
