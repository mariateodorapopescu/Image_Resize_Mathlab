function [Ix, Iy, Ixy] = precalc_d(I)
    % =========================================================================
    % Prealculeaza matricile Ix, Iy si Ixy ce contin derivatele dx, dy, dxy ale 
    % imaginii I pentru fiecare pixel al acesteia.
    % =========================================================================
    
    % Obtinem dimensiunea imaginii.
     
     [m n nr_colors] = size(I);
    
    % TODO: Tranforma matricea I in double.
     
     I = cast(I, 'double');

    % TODO: Calculeaza matricea cu derivate fata de x Ix.
 
     Ix = size(m, n);
     for i = 1 : m
       for j = 1 : n
         Ix(i, j) = 0;
       endfor
     endfor
    
    for x = 2 : n - 1
     for y = 1 : m 
      Ix(y, x) = fx(I, x, y);
      endfor
    endfor

    % TODO: Calculeaza matricea cu derivate fata de y Iy.

    Iy = size(m, n);
     for i = 1 : m
       for j = 1 : n
         Iy(i, j) = 0;
       endfor
     endfor
    
    for x = 1 : n
      for y = 2 : m - 1 
        Iy(y, x) = fy(I, x, y);
      endfor
    endfor
    
    % TODO: Calculeaza matricea cu derivate fata de xy Ixy.

    Ixy = size(m, n);
     for i = 1 : m
       for j = 1 : n
         Ixy(i, j) = 0;
       endfor
     endfor
    
    for x = 2 : n - 1
      for y = 2 : m - 1 
        Ixy(y, x) = fxy(I, x, y);
      endfor
    endfor
    
endfunction
