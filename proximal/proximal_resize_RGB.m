function out = proximal_resize_RGB(img, p, q)
    % =========================================================================
    % Redimensioneaza imaginea img astfel încât aceasta save fie de dimensiune p x q.
    % Imaginea img este colorata.
    % =========================================================================
    
    % TODO: Extrage canalul rosu al imaginii.
    
    [m n nr_colors] = size(img);
    
    for i = 1 : m
      for j = 1 : n
        r(i, j) = img(i, j, 1);
      endfor
    endfor
    
    % TODO: Extrage canalul verde al imaginii.
    
    for i = 1 : m
      for j = 1 : n
        g(i, j) = img(i, j, 2);
      endfor
    endfor
    
    % TODO: Extrage canalul albastru al imaginii.
    
   for i = 1 : m
      for j = 1 : n
        b(i, j) = img(i, j, 3);
      endfor
    endfor
    
    % TODO: Aplica functia nn pe cele 3 canale ale imaginii.
    
    red = proximal_resize(r, p, q);
    green = proximal_resize(g, p, q);
    blue = proximal_resize(b, p, q);
    
    % TODO: Formeaza imaginea finala cu cele 3 canale de culori.
    
    for i = 1 : p
      for j = 1 : q
        out(i, j, 1) = red(i, j);
      endfor
    endfor
    
    for i = 1 : p
      for j = 1 : q
        out(i, j, 2) = green(i, j);
      endfor
      
    endfor
    for i = 1 : p
      for j = 1 : q
        out(i, j, 3) = blue(i, j);
      endfor
    endfor
endfunction
