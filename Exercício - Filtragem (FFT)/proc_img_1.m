%% Leitura e exibição da imagem original e obtenção da transformada de Fourier

figure(1); 
img1 = imread('e9gla_noise.png'); imagesc(img1); colormap(gray); title('Imagem 1');

figure(2);
F1 = fft2(img1);

%% Elaboração de filtros
imagesc(abs(1 + log(fftshift(F1)))); colormap(gray); title('log(1+FFT(img1))'); % Exibindo o log do FFT
H1 = filtro_circulo(img1, 120, 17, 6);
H2 = filtro_circulo(img1, 120, 41, 6);
H3 = filtro_circulo(img1, 120, 102, 6);
H4 = filtro_circulo(img1, 120, 218, 6);
H5 = filtro_circulo(img1, 120, 277, 6);
H6 = filtro_circulo(img1, 120, 302, 6);

H = H1 & H2 & H3 & H4 & H5 & H6;

filtro_completo = F1 .* fftshift(H);
figure(3);
 
imagesc(abs(fftshift((log(1+ filtro_completo))))); colormap(gray); title('Filtros aplicados (img1)');
%% Obtendo transformada de Fourier inversa
figure(4);
imagesc(abs(ifft2(filtro_completo))); colormap(gray); title('IFFT (Img1)');