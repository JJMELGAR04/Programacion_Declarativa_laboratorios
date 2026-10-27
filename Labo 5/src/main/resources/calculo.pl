d(Var, Func, 0) :-
    atomic(Var), number(Func).


d(Var, Func, 1) :-
    Var == Func.


d(Var, N*Var, N) :-
    atomic(Var), number(N).


d(Var, Var^N, N*Var^Nm1) :-
    number(N), is(Nm1, N - 1).


d(Var, K*Var^N, C*Var^Nm1) :-
    atomic(Var), number(K), number(N), is(C, K*N), is(Nm1, N-1).


d(Var, log(Var), 1/Var) :-
    atomic(Var).


d(Var, 1/Var, -1/Var^2) :-
    atomic(Var).


d(Var, A^Var, A^Var*log(A)) :-
    atomic(Var), number(A).


d(Var, F+G, DF+DG) :-
    d(Var, F, DF), d(Var, G, DG).


d(Var, F-G, DF-DG) :-
    d(Var, F, DF), d(Var, G, DG).


s(Var, K, K*Var) :-
    number(K), atomic(Var).


s(Var, Var, 1/2*Var^2) :-
    atomic(Var).


s(Var, K*Var, K/2*Var^2) :-
    atomic(Var), number(K).


s(Var, Var^N, 1/M*Var^M) :-
    atomic(Var), number(N), N =\= -1, is(M, N+1).


s(Var, K*Var^N, K/M*Var^M) :-
    atomic(Var), number(K), number(N), N =\= -1, is(M, N+1).


s(Var, 1/Var, log(Var)) :-
    atomic(Var).


s(Var, log(Var), Var*log(Var)-Var) :-
    atomic(Var).


s(Var, A^Var, A^Var/log(A)) :-
    atomic(Var), number(A).


s(Var, F+G, SF+SG) :-
    s(Var, F, SF), s(Var, G, SG).


s(Var, F-G, SF-SG) :-
    s(Var, F, SF), s(Var, G, SG).
