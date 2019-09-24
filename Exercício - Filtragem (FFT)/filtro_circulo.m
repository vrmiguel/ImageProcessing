%% Função para filtro passa-baixa
    % img: imagem de entrada
    % pos_x: posição x do ponto do R^2 onde se quer filtrar
    % pos_y: posição y do ponto do R^2 onde se quer filtrar
    % Se quiser filtrar ao centro da imagem, ent�o [pos_x, pos_y] =
    % size(img)/2
    % r: raio do filtro
    % H: filtro passa-baixa (sa�da)

function H = filtro_circulo (img, pos_y, pos_x, r)
H = ones(size(img));

for i = -r:r
    for j = -r:r
        if ((i)^2 + (j)^2 < r^2)
            H(i+pos_x, j+pos_y) = 0;        % Formação do filtro passa-baixa
        end
    end
end

end