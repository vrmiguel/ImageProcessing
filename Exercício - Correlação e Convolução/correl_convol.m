clear all
close all
N = 256;    % N. de amostras do sinal x
passo  = pi/(N/2);
m = -pi:passo:pi-passo;
x=0;

for i = 1:3   %% Gera sinal x (soma de três senos)
    f = ( ((-1 .^ (i+1)) .* 2 .* sin(i*m)) ./ i);
    x = x+f
end

M = 32; % Número de amostras do filtro
passo = pi/(M/2);
n = -pi/6:passo:pi-passo/6;     
h = ((-1).*2.*cos(n))./2;            % Filtro de cosseno
th = length(h); hi = zeros(1, th);
i = 1:th;
hi(i) = h(th - i + 1); % Gera h(-t)
figure(1); % Exibe as figuras iniciais
tempo = 1:length(f); 
subplot(3, 1, 1); plot(tempo, x, 'r'); title('Sinal x(t)');
subplot(3, 1, 2); plot(n, h, 'g'); title('Sinal h(t)');
subplot(3, 1, 3); plot(n, hi, 'b'); title('Sinal h(-t)');
%% Calcula convolução e rotação

tx = length(x);
ti = tx + 2*th; % Calcula tam. total do sinal resultante da convolução ..
%.. considerando o problema de filtrar bordas

y = zeros(1, ti);

y(th+1 : th+tx) = x;    % Centraliza o sinal x deixando as bordas do sinal..
                        % .. com zeros o suficiente para passar o filtro h 
convol = zeros(1, ti);
correl = zeros(1, ti);

for i = 1:length(y) - th
    v = y(i:i+length(hi)-1) .* hi;
    convol(i) = sum(v);
    v = y(i:i+length(h)-1) .* h;
    correl(i) = sum(v);
end

con = convol(th+1 : end-th);    % Corta o sinal resultante para que mantenha ..
cor = correl(th+1 : end-th);    % .. o mesmo tamanho do sinal original
figure(2);
plot(tempo, con, 'r');
hold on
plot(tempo, cor, 'b');
title('Resultado da Convolução (verm.) e Correlação (verde)');
hold off