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
x = Hinv\h;

% Solución 2 -> H = LU
[L,U] = lu(H);

% Solución 3 -> H = QR
[Q,R] = qr(H);

% Premultiplicación de H por cada vector (V*H).
y1 = L'*b;
x_lu = inv(L)\y1;
b_lu = H*x_lu;

y2 = Q'*b;
x_qr = inv(R)\y2;
b_qr = H*x_qr;

% Realizar la suma de los cuadraros como métrica para evaluar los
% resultados.

r0 = sqrt(sum(b - (H*x))^2);
r1 = sqrt(sum(b - b_lu)^2);
r2 = sqrt(sum(b - b_qr)^2);

R = [r0, r1, r2];
min(R)

%--------------------------------------------------------------------------