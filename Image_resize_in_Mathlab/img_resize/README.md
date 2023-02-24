

Task 1: Interpolare proximala
1. proximal_2x2: 
- calculez distante dintre punctul (x(i),y(j)) fata de (x1,y1), (x1,y2), (x2,y1),
(x2,y2),
- caut distanta minima si aflu si pentru ce punct am obtinut-o,
pentru ca sa stiu care x(j) si y(j).
2. proximal_resize: 
- calculez factorii de scalare, apoi matricea de transformare si inversa 
acesteia dupa formulele oferite in PDF-ul temei. 
- Pentru ca nu am voie cu functii predefinite, am incercat sa fac
o functie de inversare proprie, care se bazeaza pe eliminarea gaussiana. 
- aflu x_p si y_p, aplicand transformarea inversa vectorului [x; y] 
si ii deplasez in sistemul de coordonate de la 1 la n.
- aflu cel mai apropiat vecin cu ajutorul functiei interne round. 
- valoarea pixelului din matricea finala este data de cea din 
imaginea initiala, in functie de cel mai apropiat vecin calculat anterior.
3. proximal_rotate:
- calculez cos_theta si sin_theta de unghi de rotatie
- initializez matricea initiala cu 0
- calculez matricea de transformare conform formulei din PDF
- calculez inversa ei, de data aceasta doar cu functii predefinite (inv),
asa cum si se cere in enunt
- parcurgand fiecare pixel, calculez x_p si y_p in functie de invesrul
matricei de transformare: ii pun intr-un vector v = [x;  y] ca sa calculez
mai usor, apoi ii extrag din vector ( x_p e primul element, x-ul, apoi
y_p, al doilea).
- Aflu punctele ce inconjoara x_p si y_p, aproximand la un intreg 
prin lipsa. si iau pe urmatorul punct ca fiind urmatorul intreg.
- Am grija sa raman in interiorul imaginii: adica daca una dintre
coordonate depaseste dimensiunile, atunci va deveni limita imaginii.
- Daca s-a intamplat aceasta, atunci in imaginea finala va fi pixel negru. 
- Daca nu, aflu coeficientii de interpolare si adaug la imaginea finala, 
comform formulei. 
- La final, nu uit sa aduc imaginea la un format compatibil/valid. 
4. proximal_coef:
- aici calculez coeficientii de interpolare, rezolvand sistemul de ecuatii A * a = b,
cu ajutorul formulei date in cerinta;
- prin urmare, asa cum este indicat, pun 1 pe prima coloana a matricei A,
si coordonatele asa cum este indicat.
- calculez pe vectorul b, conform formulei, pe urma aflu pe a prin inmultirea
clasica a inversei lui A cu b. (da, stiu ca nu converge ok, si nu e eficient si ca 
poate da erori in anumite cazuri, dar am zis sa nu ma complic)
5. invert:
- aceasta este functia proprie facuta ca sa inversez o matrice
- Alipesc la matricea de transformare pe matricea unitate, apoi iau pivotul (adica
elementul de pe diagonala principala si il fac factor de scalare.
- incerc sa fac in partea din stanga matricea unitate prin scalari de linii si coloane si
si scaderi de linii si coloane.
- ce ramane in dreapta este matricea inversa. (alipind cele doua matrice, A
si matricea unitate, reiese o alta matrice de n x 2n elemente; imi trebuie numai
ce e de la n+1 la 2*n).


Task2: Interpolare bicubica
1. bicubic_coef:
- definesc matricile ca in formulele prezentate: cea din stanga si din dreapta sunt
calculate conform indicatiilor date.
- cea din mijloc, inter3 (i-am zis asa ca am calculat-o a treia, desi e al doilea termen
al inmultirii), doar ca in loc de 0 si 1 pun valorile lui x1, y1, x2, y2.
- pe inter3 am format-o pe coloane, pentru ca, in urma unor observatii, trebuie
implementat cu y, x nu normal (prima data facusem matricea normal si nu prea mergea. 
dupa mai multe incercari, mi-am dat seama ca sa mearga, sa pun elementele pe coloane,
adica pe y, apoi pe x).
2+3+4. fx, fy, fxy m-am folosit de formulele prezentate in PDF, si anume "Aproximarea 
derivatelor cand acestea nu sunt cunoscute".
- ca sa functioneze, a trebuit sa interschimb pozitia lui y cu cea a lui x, adica in loc
sa pun f(x+1, y), cum era scris in varianta din PDF, a trebuit sa pun f(y, x+1).
5. precalc_d:
- am creat matricile Ix, Iy si Ixy, folosindu-ma de 2 iteratii for, astfel: ma folosesc de functiile
fx, fy si respectiv fxy pentru a calcula valoarea derivatei pe acea pozitie.
- Verific, in plus, cazul in care x-ul sa afla pe ultima coloana, adica e la marginea 
imaginii si fac derivata 0.
6. bicubic_resize:
- determin matricele cu aproximatiile derivatelor(Ix, Iy, Ixy).
- calculam punctele ce inconjoara x_p si y_p.
- calculez coeficientii de interpolare cu ajutorul functiei bicubic_coef si ii 
introduc intr-o matrice.
- folosesc formulele din PDF pentru a calcula valoarea pixelului din 
matricea finala.
- definesc doi vectori, cel linie pentru x_p si cel coloana pentru y_p.
- fac inmultirea dintre vectorul linie, matricea de coeficienti 
si vectorul coloana pentru a obtine valoarea pixelului.
7. invert:
- aceeasi functie proprie de inversare a matricei fara sa folosesc 
functie predefinita, de la Task1

P. S. Pentru cele patru functii RGB (trei task1, una task2) doar am extras cele 3 matrici, 
reprezentand cele 3 canale ale imaginii(R, G, B) si am aplicat
interpolarea/resize-ul pe fiecare dintre ele. La sfarsit am luat fiecare canal de
culoare si am adaugat acolo cele 3 matrici in rezultatul final. 
