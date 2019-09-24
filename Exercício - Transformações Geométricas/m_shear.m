%% Cisalhamento

    % Entradas: 
    %       img - imagem de entrada
    %       ch - constante de cisalhamento horizontal
    %       cv - constante de cisalhamento vertical
    % Saídas
    %       s_img - imagem cisalhada (ou sheared)

function s_img = m_shear(img, ch, cv)
    T = [1, -cv, 0; -ch, 1, 0; 0, 0, 1];  % Matriz de transformação
    s_img = zeros(size(img));             % Imagem resultante
    dims = size(img);
    
    for i = 1:dims(1)
        for j = 1:dims(2)
            z = round(T * [i j 1]');
            if z > 0
                s_img(i, j) = img(z(1), z(2));
            end
        end
    end
    
    if(class(img) == 'uint8')
        s_img = uint8(s_img);
    end
end
