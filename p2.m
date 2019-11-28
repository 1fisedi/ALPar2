%--------------------------------------------------------------------------

% Para el cargue inicial de la información.

X = load("portfolio100.mat");
X = X.Portfolio100;

% Para extracción de las primeras n columnas
n = 10;
A = X(:,1:n);

% para observar la información inicial
figure('Name', 'Data Inicial')
plot(A(:, 1), A(:, 2), 'b+');

%estandarización de la data con media normal
mu = mean(A);
md = median(A);

Amu = A - mu;
Amd = A - md;

% ejecución de PCA
[U, S] = pca(Amu);
[U2, S2] = pca(Amd);

% Para dibujar los eigenvectors centrados en la media, mostrando
% la dirección de maxima variabilidad en la muestra.
x = mu;
y = mu + 1.5 * S(1,1) * U(:,1)';

% Para dibujar los eigenvectors centrados en la mediana, mostrando
% la dirección de maxima variabilidad en la muestra.
x2 = md;
y2 = md + 1.5 * S2(1,1) * U2(:,1)';

figure('Name', 'Usando Media')
plot(x, y, '-r', 'LineWidth', 2);

figure('Name', 'Usando Mediana')
plot(x2, y2, '-g', 'LineWidth', 2);

fprintf('Max eigenvector: \n');
fprintf(' U(:,1) = %f %f \n', U(1,1), U(2,1));

fprintf('Max eigenvector 2: \n');
fprintf(' U(:,1) = %f %f \n', U2(1,1), U2(2,1));

pause
close all

%--------------------------------------------------------------------------