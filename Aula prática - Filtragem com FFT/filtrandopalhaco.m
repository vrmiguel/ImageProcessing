%% github.com/vrmiguel/ImageProcessing %%

%% Leitura e exibição da imagem original
close all
clear all
figure(1);
img = imread('palhaco.jpg');
imshow(img); title('Imagem original');

%% Aplicando os cinco filtros
F = fft2(img);
figure(2);
imagesc(abs(1 + log(fftshift(F)))); colormap(gray); title('FFT (log)'); % Exibindo o log do FFT 


H1 = filtro(img, 107, 166, 10);
H2 = filtro(img, 117, 110, 8);
H3 = filtro(img, 150, 93, 8);
H4 = filtro(img, 140, 148, 8);
H5 = filtro(img, 105, 167, 8);
Hz = H1 & H2 & H3 & H4 & H5;

filtro_completo = F .* fftshift(Hz);

figure(3);
imagesc(abs(fftshift((log( 1+ filtro_completo))))); colormap(gray); title('Após filtros (log)');

figure(4);
imagesc(abs(ifft2(filtro_completo))); colormap(gray); title('Após filtros');
