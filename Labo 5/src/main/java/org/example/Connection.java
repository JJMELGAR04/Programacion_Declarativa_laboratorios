package org.example;

import alice.tuprolog.Prolog;
import alice.tuprolog.SolveInfo;
import alice.tuprolog.Struct;
import alice.tuprolog.Term;
import alice.tuprolog.Theory;
import java.io.InputStream;

public class Connection {
    private final Prolog engine = new Prolog();

    public Connection() throws Exception {
        try (InputStream in = getClass().getResourceAsStream("/calculo.pl"))
        {
            if (in == null) throw new IllegalStateException("No se encontró calculo.pl");
            engine.setTheory(new Theory(in));
        }
    }
    public String consultar(String predicado, String expresion) throws
    Exception {
        SolveInfo info = engine.solve(predicado + "(x, " + expresion + ", R).");
        return info.isSuccess() ? formatear(info.getTerm("R"), 1200)
        : "Sin solución para esa expresión";
    }

    // tuProlog imprime los términos anidados en forma canónica ('+'(a,b)),
    // así que se arma el texto a mano respetando la precedencia.
    private static String formatear(Term t, int maxPrioridad) {
        t = t.getTerm();
        if (!(t instanceof Struct s) || s.getArity() == 0) {
            return t.toString();
        }
        String op = s.getName();
        int p = prioridad(op);
        if (s.getArity() == 2 && p > 0) {
            boolean derecha = op.equals("^");
            String izq = formatear(s.getArg(0), derecha ? p - 1 : p);
            String der = formatear(s.getArg(1), derecha ? p : p - 1);
            String sep = p == 500 ? " " : "";
            String r = izq + sep + op + sep + der;
            return p > maxPrioridad ? "(" + r + ")" : r;
        }
        StringBuilder sb = new StringBuilder(op).append("(");
        for (int i = 0; i < s.getArity(); i++) {
            if (i > 0) sb.append(", ");
            sb.append(formatear(s.getArg(i), 999));
        }
        return sb.append(")").toString();
    }

    private static int prioridad(String op) {
        switch (op) {
            case "+": case "-": return 500;
            case "*": case "/": return 400;
            case "^": return 200;
            default: return 0;
        }
    }
}
