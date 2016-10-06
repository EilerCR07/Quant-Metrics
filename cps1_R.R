rm(list = ls())

# ---------------------

# cps1
# Chris R. Eiler

# ---------------------


# Part A

# 1.a
A <- matrix(c(4, 1, 2, 6, 3, 1, 5, 8, 2, 2, 2, 12), 3, 4, byrow = TRUE)
# 1.b
dim(A)
nrow(A)
ncol(A)
# 1.c
t(A)
# 1.d
B <- A[ , -3]
# 1.e
sum(diag(B))
	# cannot compute trace of A since A is nonsquare

# 2.a
I <- diag(1, 3)
# 2.b
Z <- matrix(0, 3, 3)
# 2.c
I %*% B
B %*% I
# 2.d
Z %*% B
B %*% Z


# Part B

# 3.a
setwd('E:/QuantitativeMethods/RawData')
USGDP <- read.csv('usgdp_R.csv', header = TRUE, sep = ",")
# 3.b
USGDP <- data.matrix(USGDP)
# 3.c
nex = USGDP[ ,6] - USGDP[ ,7]
# 3.d
Y <- USGDP[ ,3] + USGDP[ ,4] + USGDP[ ,5] + nex

# 4.a
lnY = log(Y)
# 4.b
tt <- seq(1970, 2013, 1/4)
# 4.c
plot(tt[1:170], log(USGDP[ ,2], exp(1)), main = title('Log GDP over Time'), xlab = 'Date', ylab = 'Log GDP', type = 'l', col = 'blue')
# 4.d
lines(tt[1:170], lnY, typ = 'l', col = 'red', lty = 2)
legend('topleft', legend = c('log GDP', 'lnY'), col = c('blue', 'red'), title = 'legend', pch = 1)
# 4.e
barplot(nex, main = title('Net Exports'), xlab = 'Date', ylab = 'Net Exports', names.arg = tt[1:170])
legend('bottomleft', legend = '1970Q1:2012Q2')

