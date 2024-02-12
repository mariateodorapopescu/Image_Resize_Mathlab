# Image Resize in Matlab

## Task 1: Proximal interpolation

**1. proximal_2x2:**
- calculate distances between the point (x(i),y(j)) compared to (x1,y1), (x1,y2), (x2,y1),
(x2,y2),
- I look for the minimum distance and find out for which point I obtained it,
to know which x(j) and y(j).

**2. proximal_resize:**

- I calculate the scaling factors, then the transformation and inverse matrix
it according to the formulas provided in the PDF of the theme.
- Because I am not allowed with predefined functions, I tried to do it
a proper inversion function, which is based on Gaussian elimination.
- find out x_p and y_p, applying the inverse transformation to the vector [x; y]
and I move them in the coordinate system from 1 to n.
- find the nearest neighbor with the help of the internal round function.
- the pixel value in the final matrix is given by the one in
the initial image, depending on the previously calculated nearest neighbor.

**3. proximal_rotate:**
- calculate cos_theta and sin_theta of rotation angle
- I initialize the initial matrix with 0
- calculate the transformation matrix according to the formula in the PDF
- I calculate its inverse, this time only with predefined functions (inv),
as required in the statement
- going through each pixel, I calculate x_p and y_p depending on the evening
transformation matrix: I put them in a vector v = [x; y] to calculate
easier, then I extract them from the vector (x_p is the first element, the x, then
y_p, second).
- I find the points surrounding x_p and y_p, approximating to an integer
by lack. and I take the next point as the next whole.
- I take care to stay inside the image: that is, if one of
coordinates exceeds the dimensions, then it will become the border of the image.
- If this happened, then there will be a black pixel in the final image.
- If not, I find out the interpolation coefficients and add them to the final image,
according to the formula.
- At the end, don't forget to bring the image to a compatible/valid format.

**4. proximal_coef:**
- here I calculate the interpolation coefficients, solving the system of equations A * a = b,
with the help of the formula given in the request;
- therefore, as indicated, I put 1 on the first column of matrix A,
and coordinates as indicated.
- I calculate on vector b, according to the formula, then I find out on a by multiplication
classic of the inverse of A with b. (yes, I know it doesn't converge ok, and it's not efficient either
it may give errors in certain cases, but I said not to get involved)

**5. invert:**
- this is the own function made to invert a matrix
- I paste the transformation matrix on the unit matrix, then take the pivot (ie
the element on the main diagonal and make it a scaling factor.
- I am trying to make the matrix unit on the left side by scaling lines and columns and
and decreases of lines and columns.
- what remains on the right is the inverse matrix. (gluing the two matrices, A
and the unit matrix, another matrix of n x 2n elements emerges; I just need it
what is from n+1 to 2*n).


## Task2: Bicubic interpolation

**1. bicubic_coef:**
- define the matrices as in the presented formulas: the one on the left and the one on the right are
calculated according to the indications given.
- the one in the middle, inter3 (I told him that's how I calculated the third one, even though it's the second term
of multiplication), only that instead of 0 and 1 I put the values of x1, y1, x2, y2.
- on inter3, I formed it in columns, because, following some observations, it has to
implemented with y, x not normal (the first time I made the matrix normal and it didn't really work.
after several attempts, I realized that it would work, to put the elements on columns,
i.e. on y, then on x).
2+3+4. fx, fy, fxy I used the formulas presented in the PDF, namely "Approximation
derivatives when they are not known".
- for it to work, I had to exchange the position of y with that of x, i.e. instead
to put f(x+1, y), as it was written in the PDF version, I had to put f(y, x+1).

**5. precalc_d:**
- I created the matrices Ix, Iy and Ixy, using 2 for iterations, as follows: I use the functions
fx, fy and respectively fxy to calculate the value of the derivative on that position.
- I check, in addition, the case where the x is on the last column, that is, it is on the edge
of the image and make the derivative 0.

**6. bicubic_resize:**
- determine the matrices with approximations of the derivatives (Ix, Iy, Ixy).
- we calculate the points surrounding x_p and y_p.
- I calculate the interpolation coefficients with the help of the function bicubic_coef and ii
insert into a matrix.
- I use the formulas from the PDF to calculate the pixel value from
the final matrix.
- define two vectors, the line one for x_p and the column one for y_p.
- do the multiplication between the line vector and the matrix of coefficients
and the column vector to get the pixel value.

**7. invert:**
- the same own matrix inversion function without using it
predefined function, from Task1

**P.S. For the four RGB functions (three task1, one task2) I only extracted the 3 matrices,
representing the 3 channels of the image (R, G, B) and I applied
interpolation/resize on each of them. In the end I took every channel of
color and I added there the 3 matrices in the final result.**
