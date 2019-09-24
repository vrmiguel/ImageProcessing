%% Função de escala de imagem
    % img := imagem de entrada
    % s_x := variação em x
    % s_y := variação em y
    % s_img := imagem rotacionada (saída)

function s_img = m_scale(img, s_x, s_y)
%% Preenchimento da imagem (padding)

[dim_x, dim_y] = size(img); 
diag = sqrt(dim_x^2 + dim_y^2);   % Diagonal da imgm de entrada
linhas_img_p = ceil(diag - dim_x) + 2;
cols_img_p= ceil(diag - dim_y) + 2;
img_p = zeros(dim_x+linhas_img_p, dim_y+cols_img_p);
img_p(ceil(linhas_img_p/2):(ceil(linhas_img_p/2)+dim_x-1),ceil(cols_img_p/2):(ceil(cols_img_p/2)+dim_y-1)) = img;
[dim_x_p, dim_y_p] = size(img_p);

center_x = ceil((dim_y_p+1)/2); % Abscissa do ponto central da imagem
center_y = ceil((dim_x_p+1)/2); % Ordenada do ponto centra da imagem

s_img=zeros(size(img_p));

%% Aplicação de escala
for i=1:dim_x_p
    for j=1:dim_y_p
         x= (i-center_x)/s_x + center_x;
         y= (j-center_y)/s_y + center_y;
         x=round(x); y=round(y);
         if (x>0 && y>0 && x<=dim_y_p && y<=dim_x_p)
              s_img(i,j)=img_p(x,y);
         end
    end
end

if(class(img) == 'uint8')
        s_img = uint8(s_img);
end

end
