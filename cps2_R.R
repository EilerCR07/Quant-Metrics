rm(list = ls()) # clear workspace
# ----------------------

# cps2
# Chris R. Eiler

# ----------------------


# -------Question 1-------

# a.
A <- matrix(c(15, 8, 12, -7, 0, 1, 2, 3, -4), 3, 3, byrow = TRUE)
B <- matrix(c(-10, 0, 2, 6, -2/3, -1, 5, 5, 4), 3, 3, byrow = TRUE)

A + B
B + A

# b.
A - B

# c.
-1 * B + A
A - B


rm(list = ls()) # clear workspace
# -------Question 2-------

# a.
X <- matrix(c(4, 6, 1, 2), 2, 2, byrow = TRUE)
Y <- matrix(c(-3, 5, 0, 1, 7, 2, -4, 3), 2, 4, byrow = TRUE)

t(X)
t(Y)

# b.
t(X %*% Y)
t(X) %*% t(Y)


rm(list = ls()) # clear workspace
# -------Question 3-------

# a.
i <- matrix(c(3, -3, 2, 4, 7, 1, 0, 10, 5), 3, 3, byrow = TRUE)
det(i)
solve(i, diag(1, 3))

ii <- matrix(c(3, -3, 2, 0, 10, 5, 4, 7, 1), 3, 3, byrow = TRUE)
det(ii)
solve(ii, diag(1, 3))

iii <- matrix(c(1, 2, 4, 0, -5, 1, 0, 0, 10, 8, 6, 4, -3, 7, 0, 1), 4, 4, byrow = TRUE)
det(iii)
solve(iii, diag(1, 4))

# b.
print('The determinants are opposites, columns 1 are identical and i[ ,2] = ii[ ,3]')


rm(list = ls()) # clear workspace
# -------Question 4-------

# a. 
cat('Yd - C - I = 0 \n', '-0.75Yd + C + 0*I = 3000 \n', '0*Yd + 0*C + I = 750 - 1000*r \n')
A <- matrix(c(1, -1, -1, -0.75, 1, 0, 0, 0, 1), 3, 3, byrow = TRUE,
		dimnames = list(c(1, 2, 3), c('Yd', 'C', 'I')))
b <- matrix(c(0, 3000, '750 - 1000*r'), 3, 1)

# b.
b <- matrix(c(0, 3000, 750 - 1000*0.25), 3, 1)
solve(A,b)

# c.
b <- matrix(c(0, 3000, 750 - 1000*0.10), 3, 1)
solve(A, b)

# d.
m = 600/0.15
m


rm(list = ls()) # clear workspace
# -------Question 5-------

# a.
A <- matrix(c(1, 1/2, 1/2, 1), 2, 2, byrow = TRUE,
		dimnames = list(c(1, 2), c('A', 'B')))
b <- matrix(100, 2, 1)
solve(A, b)

# b.
b <- matrix(c(200, 100), 2, 1)
solve(A, b)


rm(list = ls()) # clear workspace
# -------Question 6-------

# a.
cat('X + 20*E + 0*M = 1000 + 0.2Yf \n', '0*X - 10*E + M = 450 + 0.15*Yd \n', 'X + 0*E - M = 0 \n')
A <- matrix(c(1, 20, 0, 0, -10, 1, 1, 0, -1), 3, 3, byrow = TRUE,
		dimnames = list(c(1, 2, 3), c('X', 'E', 'M')))
b <- matrix(c(1000 + 0.2*1000, 450 - 0.15*1000, 0), 3, 1)
solve(A, b)

# b. 
b <- matrix(c(1000 + 0.2*1100, 450 - 0.15*1000, 0), 3, 1)
solve(A, b)
