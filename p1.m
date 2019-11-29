%--------------------------------------------------------------------------

% Para el cargue inicial de la información de portafolio de Keneth French.

X = load("portfolio100.mat");
X = X.Portfolio100;

% Para extracción de las primeras n columnas
n = 25;

A = X(:,1:n);

% para aplicar la descomposición por valores singulares
[U, S, V] = svd(A); 

%siendo U una matrix mxn ortogonal; S una matrix diagonal y V nxn.

% Transpose V
VT = V';

a = U*U';
b = V*V';
c = U*S*V;

R = U*S*VT;

%--------------------------------------------------------------------------