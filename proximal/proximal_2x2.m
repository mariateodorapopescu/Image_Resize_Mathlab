function out = proximal_2x2(f, STEP = 0.1)
    % ===================================================================================
    % Aplica Interpolare Proximala pe imaginea 2 x 2 f cu puncte intermediare echidistante.
    % f are valori cunoscute în punctele (1, 1), (1, 2), (2, 1) ?i (2, 2).
    % Parametrii:
    % - f = imaginea ce se va interpola;
    % - STEP = distan?a dintre dou? puncte succesive.
    % ===================================================================================
    
    % TODO: Defineste coordonatele x si y ale punctelor intermediare.
    
    x = 1 : STEP : 2;
    y = 1 : STEP : 2;

    % Se afl? num?rul de puncte.
    
    n = length(x);

     % TODO: Cele 4 puncte încadratoare vor fi aceleasi pentru toate punctele din interior.

    x1 = 1;
    y1 = 1;
    x2 = 2;
    y2 = 2;
    
    % TODO: Initializeaza rezultatul cu o matrice nula n x n.
    
    out = size(n, n);
    
    for i = 1 : n
      for j = 1 : n
        out(i, j) = 0;
      endfor
    endfor
    
    % Se parcurge fiecare pixel din imaginea finala.
    
    pixel = 0;
    
    for i = 1 : n
        for j = 1 : n
            
            % TODO: Afla cel mai apropiat pixel din imaginea initiala.
           
            x1y1 = sqrt((x(i)-x1) * (x(i)-x1) + (y(j)-y1) * (y(j)-y1));
            x1y2 = sqrt((x(i)-x1) * (x(i)-x1) + (y(j)-y2) * (y(j)-y2));
            x2y1 = sqrt((x(i)-x2) * (x(i)-x2) + (y(j)-y1) * (y(j)-y1));
            x2y2 = sqrt((x(i)-x2) * (x(i)-x2) + (y(j)-y2) * (y(j)-y2));  
            
            distante = [x1y1; x1y2; x2y1; x2y2];
            
            min_dist = distante(1);
            
            for k = 1 : 4
              if min_dist > distante(k)
               min_dist = distante(k);
              endif
           endfor
           
            if (j != ceil(n/2))
              if (min_dist == x2y1)
                pixel = f(y2, x1);
              elseif (min_dist == x2y2)
                pixel = f(y2, x2);
              elseif (min_dist == x1y1)
                pixel = f(y1,x1);
              elseif (min_dist == x2y1)
                pixel = f(y1, x2);
              endif
            elseif (j == ceil(n/2)) 
              if (i < ceil(n/2))
                pixel = f(y1, x2);
              elseif (i >= (n/2))
                pixel = f(y2, x2);
            endif
            endif
            
            % TODO: Calculeaza pixelul din imaginea finala.
            
            out(i, j) = pixel;
        endfor
    endfor
endfunction
