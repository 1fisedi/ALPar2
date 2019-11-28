%--------------------------------------------------------------------------

% Creamos una matriz cualquiera
A = randn(8,5);

% Se cálcula su rango

Arank = rank(A);
fprintf('El rango de la matriz es: %i \n', Arank);

% Obtenemos los valores singulares de la matriz.
[U, S, V] = svd(A);

fprintf('Los valores singulares: \n');

display(S);

% Se transforma la matriz extrayendo solo aquellos valores no nulos.

a = S(:);
v = nonzeros(a);
disp(v);

if(Arank == size(v,1))
    fprintf('El rango es igual al número de valores singulares.\n');
end

% Se prueba que el rango de una matriz A es igual al numero de los valores
% singulares no nulos de la matriz.

%--------------------------------------------------------------------------