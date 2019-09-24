%% Função de rotação de imagem
    % img := imagem de entrada
    % deg := med. de ângulo (em graus) na qual a imagem será rotacionada
    % r_img := imagem rotacionada (saída)

function r_img = m_rotate(img, deg)
%% Preenchimento da imagem (padding)

[dim_x, dim_y] = size(img); 
diag = sqrt(dim_x^2 + dim_y^2);   % Diagonal da imgm de entrada
linhas_img_p = ceil(diag - dim_x) + 2;
cols_img_p= ceil(diag - dim_y) + 2;
img_p = zeros(dim_x+linhas_img_p, dim_y+cols_img_p);
img_p(ceil(linhas_img_p/2):(ceil(linhas_img_p/2)+dim_x-1),ceil(cols_img_p/2):(ceil(cols_img_p/2)+dim_y-1)) = img;
[dim_x_p, dim_y_p] = size(img_p);

rads = deg2rad(deg);

center_x = ceil((dim_y_p+1)/2); % Abscissa do ponto central da imagem
center_y = ceil((dim_x_p+1)/2); % Ordenada do ponto centra da imagem

r_img=zeros(size(img_p));

%% Rotação
for i=1:dim_x_p
    for j=1:dim_y_p
         x= (i-center_x)*cos(rads)+(j-center_y)*sin(rads) + center_x;
         y=-(i-center_x)*sin(rads)+(j-center_y)*cos(rads) + center_y;
         x=round(x); y=round(y);
         if (x>0 && y>0 && x<=dim_y_p && y<=dim_x_p)
              r_img(i,j)=img_p(x,y);
         end
    end
end

if(class(img) == 'uint8')
        r_img = uint8(r_img);
end

end
