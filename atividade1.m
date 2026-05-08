clear; clc;

function [Y, erro] = binarizar(X, limiar)
  X = rgb2gray(X);
  X = double(X) / 255;
  Y = X;
  [L, C] = size(X);
  numerador = 0;
  denominador = 0;

  for i=1:L
    for j=1:C
      if X(i,j) > limiar
        Y(i,j) = 1;
      else
        Y(i,j) = 0;
      endif
      numerador = numerador + (X(i,j) - Y(i,j))^2;
      denominador = denominador + X(i,j)^2;
    endfor
  endfor
  erro = numerador/denominador
endfunction

function Y = cromatizar(X)
  Y = X;
  [L,C,~] = size(Y);
  for i=1:L
    for j=1:C
      R = X(i,j,1);
      G = X(i,j,2);
      B = X(i,j,3);

      if R > G && R > B
        Y(i,j,2) = 0;
        Y(i,j,3) = 0;
      elseif G > R && G > B
        Y(i,j,1) = 0;
        Y(i,j,3) = 0;
      else
        Y(i,j,1) = 0;
        Y(i,j,2) = 0;
      endif
    endfor
  endfor
endfunction

img = imread('paisagem.jpg');
[img_binaria, erro_bin] = binarizar(img, 0.5);
img_cromatizada = cromatizar(img);

figure;

subplot(2, 2, [1, 2]);
imshow(img);
title('Original');

subplot(2, 2, 3);
imshow(img_binaria);
title('Binarizada');

subplot(2, 2, 4);
imshow(img_cromatizada);
title('Cromatizada');


