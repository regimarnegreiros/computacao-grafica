clear; clc;

function plota_triangulo(v1,v2,v3)
  % Exemplo de uso:
  % >> v1 = [0.1 0.2];
  % >> v2 = [0.3 0.2];
  % >> v3 = [0.2 0.4];
  % >> plota_triangulo(v1,v2,v3);

  x = linspace(-1,1,100);
  y = zeros(1,100);

  close all
  figure(1)
  plot(x,y,'k'); hold on;
  plot(y,x,'k');
  plot([v1(1) v2(1) v3(1) v1(1)],[v1(2) v2(2) v3(2) v1(2)]);
  axis([-1 1 -1 1]);
endfunction

% Questão 1
v1 = [0.1 0.2];
v2 = [0.3 0.2];
v3 = [0.2 0.4];
plota_triangulo(v1,v2,v3);

% Questão 2
v1c = v1/2;
v2c = v2/2;
v3c = v3/2;
plota_triangulo(v1c,v2c,v3c);

% Questão 3
vc = (v1+v2+v3)/3;
v1cc = (v1-vc)/2 + vc;
v2cc = (v2-vc)/2 + vc;
v3cc = (v3-vc)/2 + vc;
plota_triangulo(v1cc, v2cc, v3cc);

% Questão 4
t = 40;
v1r = v1*[cosd(t) sind(t); -sind(t) cosd(t)];
v2r = v2*[cosd(t) sind(t); -sind(t) cosd(t)];
v3r = v3*[cosd(t) sind(t); -sind(t) cosd(t)];
plota_triangulo(v1r, v2r, v3r);

% Questão 5
mr = [cosd(t) sind(t); -sind(t) cosd(t)]
vc = (v1+v2+v3)/3;
v1rc = (v1-vc)*mr + vc;
v2rc = (v2-vc)*mr + vc;
v3rc = (v3-vc)*mr + vc;
plota_triangulo(v1rc, v2rc, v3rc);

