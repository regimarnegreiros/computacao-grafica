clear; clc;

function X = unir(X1,X2,X3)
  X1_cinza = rgb2gray(X1);
  X2_cinza = rgb2gray(X2);
  X3_cinza = rgb2gray(X3);

  uniao = max(X1_cinza, X2_cinza);
  X = max(X3_cinza, uniao);
end

function X = borrar(imagem, N)
  imagem_d = double(imagem)/255;
  h = ones(N,N)/N^2;
  if ndims(imagem_d) == 3
    for i = 1:size(imagem_d,3)
      X(:,:,i) = conv2(imagem_d(:,:,i), h, 'same');
    end
  else
    X = conv2(imagem_d, h, 'same');
  end
end

X1 = imread('boneco.png');
X2 = imread('arvore.png');
X3 = imread('casa.png');

X1 = double(X1)/255;
X2 = borrar(X2, 3);
X3 = borrar(X3, 7);

Xunidos = unir(X1, X2, X3);
imshow(Xunidos)

