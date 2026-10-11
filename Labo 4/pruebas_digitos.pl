:- consult(digitos).

:- begin_tests(digitos).

test(caso_del_enunciado, Resultado == [1, 7, 6, 2, 8]) :-
    almacenar(82671, Resultado).

test(entero_negativo, Resultado == [5, 4, 3]) :-
    almacenar(-345, Resultado).

test(un_solo_digito, Resultado == [9]) :-
    almacenar(9, Resultado).

test(cero, Resultado == [0]) :-
    almacenar(0, Resultado).

test(ceros_al_final, Resultado == [0, 0, 1]) :-
    almacenar(100, Resultado).

test(ceros_en_medio, Resultado == [3, 0, 2, 0, 1]) :-
    almacenar(10203, Resultado).

test(numero_grande, Resultado == [9, 8, 7, 6, 5, 4, 3, 2, 1]) :-
    almacenar(123456789, Resultado).

test(verifica_lista_dada, true) :-
    almacenar(2026, [6, 2, 0, 2]).

test(rechaza_atomo, [fail]) :-
    almacenar(hola, _).

test(rechaza_decimal, [fail]) :-
    almacenar(3.5, _).

:- end_tests(digitos).
