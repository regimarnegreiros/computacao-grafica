clear; clc;

function W = criar_mascara_compressao(N, tipo)
  if strcmp(tipo, "C")
    W = ones(1,N)/N;
  else
    W = [  [ (1/N):(1/N):1 ]     [ ((N-1)/N):(-1/N):(1/N) ]   ];
    W = W/sum(W);
  endif
endfunction

function W = criar_mascara_dilatacao(M, tipo)
  if strcmp(tipo, "C")
    W = ones(1,M);
  else
    W = [  [ (1/M):(1/M):1 ]     [ ((M-1)/M):(-1/M):(1/M) ]   ];
  endif
endfunction

function Y = dilatar_comprimir(X, Dh, Dv, Ch, Cv)
  [linhas, colunas] = size(X);
  tam_h = colunas*(Dh-1)+colunas
  tam_v = linhas*(Dv-1)+linhas
  Y = zeros(tam_v, tam_h);
  Y(1:Dv:end, 1:Dh:end) = X;
endfunction

%function Y = mod_escala(X, PH, PV, QH, QV)
%  Y =

imagem = imread("br.png")

dilatar_comprimir(imagem, 3, 4, 2, 5)
