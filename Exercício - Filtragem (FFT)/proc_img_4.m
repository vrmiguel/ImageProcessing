%% Leitura e exibição da imagem original

figure(13);
img4 = imread('mit_noise_periodic.jpg'); imagesc(img4); colormap(gray); title('Imagem 4');

figure(14);
F4 = fft2(img4);
imagesc(abs(1 + log(fftshift(F4)))); title('log(1+FFT(img4))'); colormap(gray); % Exibindo o log do FFT

%% Elaboração e aplicação de filtros
H1 = filtro_retangulo(img4, [352, 673], [271, 503]);    % Filtro retangular no centro da imagem
H2 = filtro_circulo(img4, 509, 390, 3);                 % Filtro circular para ruídos menores
H3 = filtro_circulo(img4, 517, 378, 3);                 % Filtro circular para ruídos menores 
H = H1 & H2 & H3;

figure(15);
img4 = F4 .* fftshift(H);
imagesc(abs(fftshift((log(1+ img4))))); colormap gray; title('Filtros aplicados em img4');
%% Obtendo transformada inversa

figure(16);
imagesc(abs(ifft2(img4))); colormap(gray); title('IFFT (img4)');