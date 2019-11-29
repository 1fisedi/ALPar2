%--------------------------------------------------------------------------

clear;
clc;

%uso de SVD en compresión de imágenes.

% Para realizar la carga de la imagen.
imagenPrueba = imread("house1.jpg");

figure('Name','Original')
imshow(imagenPrueba)

% Para transformar la imagen y escalar grises.
I = rgb2gray(imagenPrueba);
I2 = im2double(I);

figure('Name','En escala de grises')
imshow(I2)

% para aplicar la descomposición por valores singulares
[U, S, V] = svd(I2);

% Transpose V
VT = V';

figure('Name','Imagen Transformada')
imagenSalida = U*S*VT;
imshow(imagenSalida);

% para calcular el tamaño de la decomposición.
structarrayU=whos('U');
structarrayS=whos('S');
structarrayV=whos('V');

fprintf("Tamaño U: %i \n",structarrayU.bytes);
fprintf("Tamaño S: %i \n",structarrayS.bytes);
fprintf("Tamaño V: %i \n",structarrayV.bytes);

sizeOut = structarrayU.bytes + structarrayS.bytes + structarrayV.bytes;

structarrayI=whos('imagenPrueba');
sizeIn = structarrayI.bytes;

CR = sizeOut/sizeIn;
fprintf("Ratio compresion: %f porciento \n",CR);

fprintf("Programa pausado, presiona cualquier tecla para continuar.\n");
pause
close all;

%--------------------------------------------------------------------------