function H = filtro_retangulo(img, lims_x, lims_y)
  H = zeros(size(img));
  H(lims_y(1):lims_y(2), lims_x(1):lims_x(2)) = 1;
  H(lims_y(1):lims_y(2), lims_x) = 1;

end