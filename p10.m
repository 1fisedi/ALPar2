%--------------------------------------------------------------------------

%Punto 10. Pruebe que sí A^+ es la inversa de Moore-Penrose de A, entonces:

m = 5;
n = 5;
o = 4; %orden de redondeo, dado que a plena vista los datos pueden ser
% identicos y la precisión se puede impactar en el resultado.

% Sea A una matriz mxn reales (tambien aplicaria para complejos)
A = randn(m,n);
% inversa A^-1
A_inv = inv(A);
% invera generalizada de Moore-Penrose A^+
A_mp = pinv(A);

% A) Probar que: A*A^+*A = A

RA = A*A_mp*A;

if(round(RA,o) == round(A,o))
    fprintf("Se cumple A.\n");
end

% B) Probar que: A^+AA^+=A^+

RB = A_mp*A*A_mp;

if(round(RB,o) == round(A_mp,o))
    fprintf("Se cumple B.\n");
end

% C) Probar que: A^+A=I

RC = A_mp*A;

RCdiag = diag(RC);

if(sum(round(RCdiag)) == n)
    fprintf("Se cumple C.\n");
end

% D) Probar que: AA^+ es simétrica

RD = A*A_mp;
if(issymmetric(round(RD,o)))
    fprintf("Se cumple D.\n");
end

% E) Probar que: Sí A no es singular entonces A^+ = A^-1

Arank = rank(A);

if(Arank == n)
    if(round(A_mp,o) == round(A_inv,o))
    fprintf("Se cumple E.\n");
    end
else
    fprintf("La matriz es no-singular.\n");
end

%--------------------------------------------------------------------------