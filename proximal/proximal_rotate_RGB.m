function out = proximal_rotate_RGB(img, rotation_angle)
    % =========================================================================
    % Aplica Interpolarea Proximala pentru a roti o imagine RGB cu un unghi dat.
    % =========================================================================
    
    % TODO: Extrage canalul rosu al imaginii.
    
    r(:,:) = img(:,:,1);
    
    % TODO: Extrage canalul verde al imaginii.
    
    g(:,:) = img(:,:,2);
    
    % TODO: Extrage canalul albastru al imaginii.
    
    b(:,:) = img(:,:,3);
    
    % TODO: Aplica functia nn pe cele 3 canale ale imaginii.
    
    red = proximal_2x2(r, STEP);
    green = proximal_2x2(g, STEP);
    blue = proximal_2x2(b, STEP);
    
    % TODO: Formeaza imaginea finala cu cele 3 canale de culori.
    
    out(:,:,1) = red(:,:);
    out(:,:,2) = green(:,:);
    out(:,:,3) = blue(:,:);
    
endfunction
