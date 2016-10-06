rm(list = ls()) # clear workspace
# -----------------------------------

# cps3
# eilerislmsolve.R
# author: Chris R. Eiler

# -----------------------------------

eilerislmsolve <- function(c0 = 1500, c1 = 0.75, b0 = 400, b1 = 0.05, b2 = -2000, l1 = 0.1, l2 = -500, M = 195000, G = 200, P = 200, T = 0) {
coef <- matrix(c(-c1, 1, 0, 0, -b1, 0, 1, -b2, l1, 0, 0, l2, -1, 1, 1, 0), 4, 4, byrow = TRUE,
		dimnames = list(c('[1, ]', '[2, ]', '[3, ]', '[4, ]'), c('Y', 'C', 'I', 'r')))
	soln <- solve(coef, matrix(c(c0 - c1*T, b0, M/P, G), 4))
	print(soln)
}

# ------------------------------------

cat('eilerislmsolve() instructions: \n', '\n', 'the function solves an islm model that follows the form: \n',
        'C = c0 + c1.(Y - T) \n', 'I = b0 + b1.Y + b2.r \n', 'G = G0 \n', 'T = T0 \n', 
        'L(r, Y) = l1.Y + l2.r \n', 'M = M0 \n', 'P = P0 \n', 'Y = C + I + G \n', 'M / P = L(r, Y) \n', '\n', 
        '\n', 'the parameters and exogenous variables that can be specified by the function are: \n', 'c0 \n',
        'c1 \n', 'b0 \n', 'b1 \n', 'b2 \n', 'l1 \n', 'l2 \n', 'G \n', 'M \n', 'P \n', 'T \n', '\n',
        'else, there are default values within the function \n', 'to call default values: call empty function eilerislmsolve() \n')


c1 <- c(0.5, 0.55, 0.6, 0.7, 0.75, 0.8, 0.85, 0.9, 0.95)

Y <- NA

# comparitive statics
for(i in 1:9) {
	Y[i] <- eilerislmsolve(c1 = c1[i])[1, ] # create a vector of output
}


# create graphics
YvMPC <- plot(c1, Y, type = 'o', xlab = 'MPC', ylab = 'Output', main = title('Output vs Marginal Propensity to Consume'))
