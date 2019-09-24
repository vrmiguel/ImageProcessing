function p_img = m_padding(img)

[dim_x, dim_y] = size(img); 
diag = sqrt(dim_x^2 + dim_y^2);   % Diagonal da imagem de entrada
linhas_p_img = ceil(diag - dim_x) + 2;
cols_p_img= ceil(diag - dim_y) + 2;
p_img = zeros(dim_x+linhas_p_img, dim_y+cols_p_img);
p_img(ceil(linhas_p_img/2):(ceil(linhas_p_img/2)+dim_x-1),ceil(cols_p_img/2):(ceil(cols_p_img/2)+dim_y-1)) = img;

if(class(img) == 'uint8')
    p_img = uint8(p_img);
end

end