%--------------------------------------------------------------------------

% Para el cargue inicial de la información.

X = load("portfolio100.mat");
X = X.Portfolio100;

% Para organizar cada columna de menor a mayor y poder cortar los datos 
% usando la media recortada y obtener la misma base para los demás.
data = sort(X,1);

% para realizar la acotación de la media o media recortada an 10%
eliminar = round(0.10 * size(data,1));

% Para ordenar cada columna.
AFiltered = data;
AFiltered(1:(eliminar/2),:) = [];
AFiltered(1:end-(size(AFiltered,1)-(eliminar/2)),:) = [];

% remove the mean variable-wise (row-wise)
dataMean = data - repmat(mean(data,2),1,size(data,2));
dataMedian = data - repmat(median(data,2),1,size(data,2));
dataMediaR = AFiltered - repmat(mean(AFiltered ,2),1,size(AFiltered ,2));

% calcular autovectores W, and autovalores de la matriz de covarianzas.
[W, EvalueMatrix] = eig(cov(dataMean'));
Evalues = diag(EvalueMatrix);

[W2, EvalueMatrix2] = eig(cov(dataMedian'));
Evalues2 = diag(EvalueMatrix2);

[W3, EvalueMatrix3] = eig(cov(dataMediaR'));
Evalues3 = diag(EvalueMatrix3);

% order by largest eigenvalue
Evalues = Evalues(end:-1:1);
W = W(:,end:-1:1);
W = W';

Evalues2 = Evalues2(end:-1:1);
W2 = W2(:,end:-1:1);
W2 = W2';

Evalues3 = Evalues3(end:-1:1);
W3 = W3(:,end:-1:1);
W3 = W3';

% generate PCA component space (PCA scores)
pc = W * dataMean;
pc2 = W2 * dataMedian;
pc3 = W3 * dataMediaR;

% plot PCA space of the first two PCs: PC1 and PC2
figure('Name', 'Usando Media')
plot(pc(1,:),pc(2,:),'ro', 'LineWidth', 2);

figure('Name', 'Usando Mediana')
plot(pc2(1,:),pc2(2,:),'go', 'LineWidth', 2);

figure('Name', 'Usando Media Recortada')
plot(pc3(1,:),pc3(2,:),'bo', 'LineWidth', 2);

fprintf("Programa pausado, presiona cualquier tecla para continuar.\n");
pause
close all

%--------------------------------------------------------------------------