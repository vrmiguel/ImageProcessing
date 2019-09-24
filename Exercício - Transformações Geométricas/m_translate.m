%% Translação
    % https://github.com/vrmiguel/image_processing/blob/master/TransfsGeometricas/m_translate.m
    % Entradas: 
    %       img - imagem de entrada
    %       dx - distância horizontal
    %       dy - distância vertical
    % Saídas
    %       t_img - imagem transladada
function t_img = m_translate(img, dx, dy)
    t_img = zeros(size(img));              % Imagem resultante
    dims = size(img);
    
    for i = 1:dims(1)
        for j = 1:dims(2)
            x= i - dx;
            y= j - dy;
            x=round(x); y=round(y);
            if (x>0 && y>0 && x < dims(1) && y < dims(2))
                t_img(i,j)=img(x,y);
            end
        end
    end
    
    if(class(img) == 'uint8')
        t_img = uint8(t_img);
    end
end

%             z = round(T * [i j 1]');
%             if z > 0 & z <= size(img)
%                 t_img(i, j) = img(z(1), z(2));
%             end
