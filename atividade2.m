clear; clc;

function [Y1, Y2] = saturacao_min_max(X)
  Xhsv = rgb2hsv(X);
  Y1 = Y2 = Xhsv;
  Y1(:,:,2) = 0;
  Y2(:,:,2) = 1;
  Y1 = hsv2rgb(Y1);
  Y2 = hsv2rgb(Y2);
endfunction

function Y = inverter(X)
  Y = rgb2hsv(X);
  Y(:,:,1) = 1-Y(:,:,1);
  Y = hsv2rgb(Y);
endfunction

X = imread('borboleta.jpg');
[Ymin, Ymax] = saturacao_min_max(X);
Yinv = inverter(X);

figure;

subplot(2,2,1);
imshow(X);
title('Imagem Original');

subplot(2,2,2);
imshow(Yinv);
title('Inversão de Tonalidade');

subplot(2,2,3);
imshow(Ymin);
title('Saturação Mínima');

subplot(2,2,4);
imshow(Ymax);
title('Saturação Máxima');

