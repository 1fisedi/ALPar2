%--------------------------------------------------------------------------

% Punto 4 usando los datos de portfolio.

X = load("portfolio100.mat");
X = X.Portfolio100;

Xrank = rank(X);

fprintf('El rango de la matriz es: %i \n', Xrank);

% Obtenemos los valores singulares de la matriz.
[U, S, V] = svd(X);

% Se transforma la matriz extrayendo solo aquellos valores no nulos.

a = S(:);
v = nonzeros(a);

fprintf('El # de los valores singulares son %i y los valores son: \n', ...
    size(v,1));
disp(v);

%--------------------------------------------------------------------------