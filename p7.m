%--------------------------------------------------------------------------

% para definir el sistema

x1 = linspace(-5,5,100);

y1 = -2*x1+1;
y2 = 3*x1+2;
y3 = -5*x1+8;

% para graficar el sistema
plot(x1, y1, '-r','LineWidth', 3)
hold on

plot(x1, y2,'-g','LineWidth', 3)
plot(x1, y3, '-b','LineWidth', 3)

% Se observa que no tiene una solución, por lo cual se pasa la ecuación a 
%una matriz.

A = [-2 -1; 3 -1; -5 -1];
b = [-1; -2; -8];

%Ax = b
Apseudo = pinv(A);

% Ahora podemos usarla para encontrar x=A+ *b

x = Apseudo*b;

% Para graficar la solución.

scatter(x(1),x(2), 'k+', 'LineWidth', 3)

hold off
pause;
close all;

%--------------------------------------------------------------------------