%% Leitura e exibição da imagem original
clear all

figure(5); 
img2 = imread('imagem_defeito.jpg'); imagesc(img2); colormap(gray); title('Imagem 2');
img2 = rgb2gray(img2);

%% Obtendo FFT da imagem

figure(6);
F2 = fft2(img2);

imagesc(abs(1 + log(fftshift(F2)))); title('log(1+FFT(img2))'); colormap(gray); % Exibindo o log do FFT

%% Obtenção de elaboração de filtros
H1 = filtro_circulo(img2, 122, 5, 4);
H2 = filtro_circulo(img2, 113, 43, 6);
H3 = filtro_circulo(img2, 97, 121, 6);
H4 = filtro_circulo(img2, 87, 159, 3);
H5 = filtro_circulo(img2, 80, 36, 3);
H6 = filtro_circulo(img2, 130, 127, 3);

H = H1 & H2 & H3 & H4 & H5 & H6;

filtro_completo = F2 .* fftshift(H);

figure(7);
imagesc(abs(fftshift((log(1+ filtro_completo))))); colormap(gray); title('Filtros aplicados (img2)');

%% Obtendo Transformada de Fourier Inversa
figure(8);
imagesc(abs(ifft2(filtro_completo))); colormap(gray); title('IFFT (Img2)');