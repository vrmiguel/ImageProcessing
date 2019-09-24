%% Função de escala de imagem sem preenchimento (sem padding)
    % img := imagem de entrada
    % s_x := variação em x
    % s_y := variação em y
    % s_img := imagem rotacionada (saída)

function s_img = m_scale(img, s_x, s_y)
%% Preenchimento da imagem (padding)
% 
[dim_x, dim_y] = size(img); 

center_x = ceil((dim_y+1)/2); % Abscissa do ponto central da imagem
center_y = ceil((dim_x+1)/2); % Ordenada do ponto centra da imagem

s_img=zeros(size(img));

%% Aplicação de escala
for i=1:dim_x
    for j=1:dim_y
         x= (i-center_x)/s_x + center_x;
         y= (j-center_y)/s_y + center_y;
         x=round(x); y=round(y);
         if (x>0 && y>0 && x<=dim_x && y<=dim_y)
              s_img(i,j)=img(x,y);
         end
    end
end

if(class(img) == 'uint8')
        s_img = uint8(s_img);
end

end
