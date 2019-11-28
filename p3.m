%--------------------------------------------------------------------------

% CASO A - Usando una matriz aleatoria de valores no correlados.
A = rand(1e5,2);

% Se obtiene la matriz de correlación.
Acorr = corr(A);

% Se calcula el determinante
Adet = det(Acorr);

fprintf( ...
    'El determinante de la matriz de variables incorreladas es = %f\n', ...
    Adet);

% Caso B - Alguna de las variables es combinación lineal de otras.

B = [ 1 2 3 4 5; 10 20 30 40 50; 444 555 666 777 888; 0 0 13 13 12; ...
    1 1 1 1 1];

% Para obtener el rango de la matriz
Bdet = det(B);

fprintf('El determinante de la matriz singular es: %f\n', Bdet);

% El determinante es cero indicando que la matriz es singular.

% CASO C - Determinante de la matriz de varianzas y covarianzas.

C = load("portfolio100.mat");
C = C.Portfolio100;

n = 15;

C = C(:,1:n);

% Para obtener la matriz de covarianzas.
Ccov = cov(C);

Cdet = det(Ccov);

fprintf('El determinante de la mat de covarianzas es: %f\n', Cdet);

%--------------------------------------------------------------------------