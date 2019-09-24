clear all

    %%% Não funcionando !

x = imread('gaviao_cinza.jpg');
h = imread('gauss2D_pequena.jpg');

correl = correlacao(x, h);

figure(1);
subplot(3, 1, 1); title('Imagem original'); imshow(x);
subplot(3, 1, 2); title('Filtro gaussiano'); imshow(h);
subplot(3, 1, 3); title('Correlação'); imshow(correl);
