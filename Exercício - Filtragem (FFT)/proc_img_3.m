%% Leitura e exibição da imagem original
clear all

figure(9); 
img3 = imread('imagem_defeito2.JPG'); imagesc(img3); colormap(gray); title('Imagem 3');
img3 = rgb2gray(img3);

figure(10);
F3 = fft2(img3);

imagesc(abs(1 + log(fftshift(F3)))); title('log(1+FFT(img3))'); colormap(gray); % Exibindo o log do FFT
%% Elaboração e aplicação de filtros

H1 = filtro_circulo(img3, 102, 103, 4);
H2 = filtro_circulo(img3, 111, 112, 4);
H3 = filtro_circulo(img3, 119, 120, 4);
H4 = filtro_circulo(img3, 137, 137, 4);
H5 = filtro_circulo(img3, 145, 146, 4);
H6 = filtro_circulo(img3, 154, 154, 4);

H = H1 & H2 & H3 & H4 & H5 & H6;

filtro_completo = F3 .* fftshift(H);

figure(11);
imagesc(abs(fftshift((log(1+ filtro_completo))))); colormap(gray); title('Filtros aplicados (img3)');
 
%% Obtendo transformada de Fourier inversa
figure(12);
 
imagesc(abs(ifft2(filtro_completo))); colormap(gray); title('IFFT (img3)');