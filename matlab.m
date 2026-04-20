% 1 Dominio 
figure('Name','Dominio');
x = linspace(-4, 4, 200);
y = linspace(-4, 10, 200);
[X, Y] = meshgrid(x, y);
cond = Y <= 9 - X.^2;
contourf(X, Y, cond, [0.5 1], 'FaceColor', [0.8 0.9 1], 'EdgeColor','none');
hold on;


fcontour(@(x,y) 9 - x.^2 - y, [-4 4 -4 10], 'LevelList', 0, 'LineColor', 'r', 'LineWidth', 2);
xlabel('x'); ylabel('y');
title('Dominio de f(x,y) = \sqrt{9 - x^2 - y}$');
grid on;
axis equal;
saveas(gcf, 'dominio.eps');
hold off 

f_parab = @(x,y) 2*x.^2 + 5*y.^2;
f_hip   = @(x,y) x.^2 - 3*y.^2;
f_plano = @(x,y) 12 - 2*x - 3*y;
f_siny  = @(x,y) x.*sin(y);

% 2 paraboloide 
figure('Name','Paraboloide');
[X,Y] = meshgrid(linspace(-2,2,100), linspace(-2,2,100));
Z = f_parab(X,Y);
surf(X,Y,Z, 'EdgeColor','none');
colormap('viridis');
xlabel('x'); ylabel('y'); zlabel('z');
title('Paraboloide elíptico: f(x,y) = 2x^2 + 5y^2');
colorbar;
saveas(gcf, 'paraboloide.eps');

% 3 hiperbólico 
figure('Name','Hiperbolico');
Z = f_hip(X,Y);
surf(X,Y,Z, 'EdgeColor','none');
colormap('viridis');
xlabel('x'); ylabel('y'); zlabel('z');
title('Paraboloide hiperbólico: f(x,y) = x^2 - 3y^2');
colorbar;
saveas(gcf, 'hiperbolico.eps');

% 4 plano
figure('Name','Plano');
[X,Y] = meshgrid(linspace(-2,5,100), linspace(-2,5,100));
Z = f_plano(X,Y);
surf(X,Y,Z, 'EdgeColor','none');
colormap('viridis');
xlabel('x'); ylabel('y'); zlabel('z');
title('Plano: f(x,y) = 12 - 2x - 3y');
colorbar;
saveas(gcf, 'plano.eps');

% 5 trazas 
figure('Name','Trazas');

subplot(1,2,1);
y_vals = linspace(-pi, pi, 200);
z_traza_x1 = 1 * sin(y_vals);
plot(y_vals, z_traza_x1, 'LineWidth', 2);
xlabel('y'); 
ylabel('z');
title('$f(1,y) = \sin(y)$', 'Interpreter', 'latex', 'FontSize', 12);
grid on;

subplot(1,2,2);
x_vals = linspace(-2, 2, 200);
z_traza_y_pi2 = x_vals * sin(pi/2);  % sin(pi/2) = 1
plot(x_vals, z_traza_y_pi2, 'LineWidth', 2);
xlabel('x'); 
ylabel('z');
title('$f(x,\pi/2) = x$', 'Interpreter', 'latex', 'FontSize', 12);
grid on;

saveas(gcf, 'trazas.png');z

% 6 contorno_parab
figure('Name','Contorno Paraboloide');
[Xc,Yc] = meshgrid(linspace(-2,2,200), linspace(-2,2,200));
contour(Xc, Yc, f_parab(Xc,Yc), 15, 'LineWidth',1);
colormap('plasma');
colorbar;
xlabel('x'); ylabel('y');
title('Curvas de nivel de f(x,y)=2x^2+5y^2');
grid on;
saveas(gcf, 'contorno_parab.eps');

% 7 contorno_hip
figure('Name','Contorno Hiperbolico');
contour(Xc, Yc, f_hip(Xc,Yc), 15, 'LineWidth',1);
colormap('plasma');
colorbar;
xlabel('x'); ylabel('y');
title('Curvas de nivel de f(x,y)=x^2-3y^2');
grid on;
saveas(gcf, 'contorno_hip.eps');

% 8 contorno_plano
figure('Name','Contorno Plano');
[Xp,Yp] = meshgrid(linspace(-2,8,200), linspace(-2,6,200));
Zp = f_plano(Xp,Yp);
contour(Xp, Yp, Zp, 10, 'LineWidth',1);
colorbar;
xlabel('x'); ylabel('y');
title('Curvas de nivel del plano f(x,y)=12-2x-3y');
grid on;
saveas(gcf, 'contorno_plano.eps');

%9 solo calculo tasa de cambio 
A = [0,0]; B = [1,0]; C = [0,1];
tasa_AB = (f_plano(B(1),B(2)) - f_plano(A(1),A(2))) / norm(B-A);
tasa_AC = (f_plano(C(1),C(2)) - f_plano(A(1),A(2))) / norm(C-A);
fprintf('Tasa de cambio A->B: %.4f\n', tasa_AB);
fprintf('Tasa de cambio A->C: %.4f\n', tasa_AC);

h = 1e-5;
fx = (f_plano(A(1)+h, A(2)) - f_plano(A(1)-h, A(2))) / (2*h);
fy = (f_plano(A(1), A(2)+h) - f_plano(A(1), A(2)-h)) / (2*h);
fprintf('Gradiente numérico en A: (%.4f, %.4f)\n', fx, fy);
dir_ascenso = -[fx, fy] / norm([fx, fy]);
fprintf('Dirección de máximo ascenso (unitaria): (%.4f, %.4f)\n', dir_ascenso(1), dir_ascenso(2));

%10 Campo de gradiente 
figure('Name','Ascenso');
[Xq, Yq] = meshgrid(linspace(-2,2,20), linspace(-2,2,20));
Zq = f_parab(Xq, Yq);
[Fx, Fy] = gradient(Zq, 0.2105, 0.2105);
quiver(Xq, Yq, Fx, Fy, 0.5, 'r');
hold on;
contour(Xq, Yq, Zq, 15, 'LineWidth',1);
xlabel('x'); ylabel('y');
title('Dirección de máximo ascenso (flechas) sobre curvas de nivel');
grid on;
saveas(gcf, 'ascenso.eps');
hold off;


