%--------------------------------------------------------------------------

% Para la carga de datos de portafolio100.

Data = load("portfolio100.mat");
Data = Data.Portfolio100;

% Para la creación de la matriz de Hilbert de orden n.
n = 100;
H = hilb(n);

% Sistema HX = b, siendo b la primera fila de porfolio.
b = Data(1,:)';

Hcond = cond(H);
fprintf('Número condición de la matriz: %s \n', Hcond);

%--------------------------------------------------------------------------
% Solición del sistema HX=b
h=H*b;

% Solución 1 -> X = H-1 *b
Hinv = inv(H);
X = Hinv\h;

% Solución 2 -> H = LU
[L,U] = lu(H);

% Solución 3 -> H = QR
[Q,R] = qr(H);

% Premultiplicación de H por cada vector (V*H).

one = X'*H;
two = L*H; 

%--------------------------------------------------------------------------