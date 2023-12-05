function A = bicubic_coef(f, Ix, Iy, Ixy, x1, y1, x2, y2)
    % =========================================================================
    % Calculeaz? coeficien?ii de Interpolare Bicubic? pentru 4 puncte al?turate
    % =========================================================================

    % TODO: Calculeaz? matricile intermediare.
    
    inter1 = [1 0 0 0; 0 0 1 0; -3 3 -2 -1; 2 -2 1 1];
    inter2 = [1 0 -3 2; 0 0 3 -2; 0 1 -2 1; 0 0 -1 1];
    
    inter3 = size(4, 4);
    
    for i = 1 : 4
      for j = 1 : 4
        inter3(i, j) = 0;
      endfor
    endfor
    
    inter3(:, 1) = [f(y1, x1) f(y1, x2) Ix(y1, x1) Ix(y1, x2)];
    inter3(:, 2) = [f(y2, x1) f(y2, x2) Ix(y2, x1) Ix(y2, x2)];
    inter3(:, 3) = [Iy(y1, x1) Iy(y1, x2) Ixy(y1, x1) Ixy(y1, x2)];
    inter3(:, 4) = [Iy(y2, x1) Iy(y2, x2) Ixy(y2, x1) Ixy(y2, x2)];
    
   % TODO: Converte?te matricile intermediare la double.
    
    inter1 = cast(inter1, 'double');
    inter2 = cast(inter2, 'double');
    inter3 = cast(inter3, 'double');

   % TODO: Calculeaz? matricea final?.
    
    A = inter1 * inter3 * inter2;

endfunction