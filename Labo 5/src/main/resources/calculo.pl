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


s(Var, K, K*Var) :-
    number(K), atomic(Var).


s(Var, Var, 1/2*Var^2) :-
    atomic(Var).


s(Var, K*Var^N, K/M*Var^M) :-
    atomic(Var), number(K), number(N), is(M, N+1).
