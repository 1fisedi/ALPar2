%--------------------------------------------------------------------------

% Para el cargue inicial de la información de portafolio de Keneth French.

X = load("portfolio100.mat");
X = X.Portfolio100;

% Para extracción de las primeras n columnas
n = 5;

A = X(:,1:n);

% para aplicar la descomposición por valores singulares
[U, S, V] = svd(A); 

%siendo U una matrix mxn ortogonal; S una matrix diagonal y V nxn.

%--------------------------------------------------------------------------