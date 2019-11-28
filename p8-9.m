%--------------------------------------------------------------------------

% 8. Simule 1000 datos de variables aleatoria Normales Xi\ ~\ Normal\ 
% (i,\ 1) para i = 1, 2, 3, 4, 5. Defina la variable 
% y=\sum_{i=1}^{1000}\frac{1}{i}*X_i\ +\ \epsilon , donde 
% \mathbit{\epsilon}\ ~\ \mathbit{Normal}\ (\mathbf{0},\ \mathbf{0}.
% \mathbf{5}). Sea A\ =[X1\ X2\ X3\ X4\ X5] la matriz de 1000×5 donde sus
% columnas son las realizaciones de X1,X2,X3,X4,X5. Calcule la inversa 
% generalizada de A y pre-multipl?quela por el vector y. ¿Qué observa?

% Para la simulación de los datos.
n = 1000;
sigma=1;
error=mvnrnd(0,0.5,n);

% Para la prealocación y definición

X1 = zeros(n,1);
X2 = zeros(n,1);
X3 = zeros(n,1);
X4 = zeros(n,1);
X5 = zeros(n,1);
Y = zeros(n,1);

for i=1:n
    
    x1 = mvnrnd(i,sigma,1);
    x2 = mvnrnd(i,sigma,1);
    x3 = mvnrnd(i,sigma,1);
    x4 = mvnrnd(i,sigma,1);
    x5 = mvnrnd(i,sigma,1);  
    
    x_i = x1 + x2 + x3 + x4 + x5;    
    Y(i) = (1/i)* x_i + error(i);
    
    X1(i) = x1;
    X2(i) = x2;
    X3(i) = x3;
    X4(i) = x4;
    X5(i) = x5;
end

A = [X1 X2 X3 X4 X5];

% para cálculo de la inversa generalizada de Moore-Penrose.
Apseudo = pinv(A);

betas = Apseudo*Y;

% Se observa la solución de un sistema de la forma y=x*b -> b=x_inv*y y
% se concluye que se pueden obtener los betas de una regresión lineal
% usando la inversa generalizada.

% punto 9. Para calcular el modelo de regresión

b = A\Y;

fitlm(A, Y)

%--------------------------------------------------------------------------