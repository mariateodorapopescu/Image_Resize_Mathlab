function R = proximal_rotate(I, rotation_angle)
    % =========================================================================
    % Roteste imaginea alb-negru I de dimensiune m x n cu unghiul rotation_angle,
    % aplicând Interpolare Proximala.
    % rotation_angle este exprimat în radiani.
    % =========================================================================
    [m n nr_colors] = size(I);
    
    % Se converteste imaginea de intrare la alb-negru, daca este cazul.
    if nr_colors > 1
        R = -1;
        return
    endif

    % Obs:
    % Atunci când se aplica o scalare, punctul (0, 0) al imaginii nu se va deplasa.
    % În Octave, pixelii imaginilor sunt indexati de la 1 la n.
    % Daca se lucreaza în indici de la 1 la n si se inmultesc x si y cu s_x respectiv s_y,
    % atunci originea imaginii se va deplasa de la (1, 1) la (sx, sy)!
    % De aceea, trebuie lucrat cu indici în intervalul [0, n - 1].

    % TODO: Calculeaza cosinus si sinus de rotation_angle.
    
    cos_teta = cos(rotation_angle);
    sin_teta = sin(rotation_angle);
    
    % TODO: Initializeaza matricea finala.
    
    R = seize(m, n);
    for i = 1 : m
      for j = 1 : n
        R(i, j) = 0;
      endfor
    endfor

    % TODO: Calculeaza matricea de transformare.
    
    T = size(2, 2);
    
    for i = 1 : 2
      for j = 1 : 2
        R(i, j) = 0;
      endfor
    endfor
    
    T(1, 1) = cos_teta;
    T(1, 2) = -sin_teta;
    T(2, 1) = sin_teta;
    T(2, 2) = cos_teta;

    % TODO: Inverseaza matricea de transformare, FOLOSIND doar functii predefinite!

    T_inv = size(2, 2);
    
    for i = 1 : 2
      for j = 1 : 2
        T_inv(i, j) = 0;
      endfor
    endfor
    
    T_inv = inv(T);

    % Se parcurge fiecare pixel din imagine.
    
    for y = 0 : m - 1
        for x = 0 : n - 1
            
            % TODO: Aplica transformarea inversa asupra (x, y) si calculeaza x_p si y_p
            % din spatiul imaginii initiale.

           v = [x; y];
           v = T_inv * v;
           for j = 1 : 2
                    v(j, 1) = v(j, 1) + 1;
           endfor 
           xp = v(1,1);
           yp = v(2,1);
            
            % TODO: Daca xp sau yp se afla în exteriorul imaginii,
            % se pune un pixel negru si se trece mai departe.
            
            % TODO: Afla punctele ce înconjoara(xp, yp).

            x1 = floor(xp);
            x2 = x1 + 1;
            y1 = floor(yp);
            y2 = y1 + 1;
            
            if (round(yp) >= m)
              y2 = m;
              y1 = m - 1;
            endif
            
            if x2 >= n
              x2 = n;
              x1 = n - 1;
            endif
            
            if (x1 < 1 || y1 <1 || x2 >= n || y2 >= m)
              R(y+1, x+1) = 0;
            else
              a = proximal_coef(I, x1, y1, x2, y2);
              R(y+1, x+1) = a(1,1) + a(2,1) * xp + a (3,1) * yp + a(4,1) * xp * yp;
            endif
            
            % TODO: Calculeaza coeficientii de interpolare notati cu a
            % Obs: Se poate folosi o functie auxiliara în care sau se calculeze coeficientii,
            % conform formulei.

            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
           
            % TODO: Calculeaza valoarea interpolata a pixelului (x, y).
            
        endfor
    endfor

    % TODO: Transforma matricea rezultata în uint8 pentru a fi o imagine valida.
      
    R = (uint8)R;
    
endfunction
