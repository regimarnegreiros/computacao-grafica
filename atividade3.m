clear; clc;

function X = cria_seg_reta(v0,vf,L,C)
  X = zeros(L,C);

  modi = abs(v0(1) - vf(1));
  modj = abs(v0(2) - vf(2));

  N = max([modi,modj]);

  for k=0:N
    tk = k/N;
    pn = (1-tk)*v0 + tk*vf;
    i = round(pn(1));
    j = round(pn(2));
    X(i,j) = 255;
  endfor
endfunction

function X = cria_poligno(centro,raio,n_lados,L,C)
  X = zeros(L,C);
  t = 360/n_lados;
  xiant = 0;
  yiant = 0;

  for k=0:n_lados
    xi = round(centro(1)+raio*cos(2*pi*k/n_lados));
    yi = round(centro(2)+raio*sin(2*pi*k/n_lados));

    X(xi,yi) = 255;
    if k != 0
      Nimg = cria_seg_reta([xiant,yiant],[xi,yi],L,C);
      X = max(X,Nimg);
    endif
    xiant = xi;
    yiant = yi;
  endfor
endfunction

figure(1);
subplot(1, 2, 1);
imshow(cria_seg_reta([3,4], [20,15], 20, 20));
title("v0 = [3, 4], v1 = [20, 15], 20x20");
subplot(1, 2, 2);
imshow(cria_seg_reta([20 30], [90 110], 150, 150));
title("v0 = [20, 30], v1 = [90, 110], 150x150");

nomes = {'quadrado', 'pentágono', 'hexágono', 'heptágono'};

figure(2);
for i = 1:4
  subplot(2, 2, i);
  imshow(cria_poligno([25,25], 20, i + 3, 50,50));
  title(nomes(i));
endfor
