rm(list = ls())

# -----------------------------------

# cps4.R
# eilerols.R
# author: Chris R. Eiler

# -----------------------------------



# This script is results in outputting linear regression results for a data.matrix
# The output will include:
	# the coefficents
	# standard errors
	# the R-squared

# There is a closed off portion of the code for my refrence. It is incredibly slow due to amount
# of iterations in it. I kept it there as an example of how not to do it quickly.




eilerols <- function(A.data, y) {
## Setup
	A.matrix <- data.matrix(A.data)
	depend <- A.matrix[ ,y]
	data <- cbind(matrix(1, nrow = nrow(A.matrix)), A.matrix[ ,-y])
		for(j in 1:ncol(data)){
			dev.new(plot(data[ ,j], depend))
		}
	View(data)
## Estimate the estimators
		tX.X <- t(data) %*% data
		inv.tX.X <- solve(tX.X, diag(1, nrow(tX.X)))
		tY.X <-  t(depend) %*% data
		beta_hat <- matrix(tY.X %*% inv.tX.X, 1)
## Some prep for printing
			y.mean = mean(depend)
			index <- matrix(1:ncol(beta_hat), nrow(beta_hat))
			model.coef <- rbind(index, beta_hat)
#			fits <- matrix(NA, nrow= nrow(data), ncol = ncol(beta_hat))
#		for(i in 1:nrow(data)){
#			for(j in 1:ncol(beta_hat)){
#				fits[i,j] <- data[i,j] * beta_hat[ ,j]
#				View(fits)
#				fitted <- sum(fits[ ,1:ncol(fits)])
#				View(fitted)
#			}
#		}
## View fitted and residual values
		resid <- depend - (data %*% inv.tX.X %*% t(data) %*% depend)
		fitted <- depend - resid
			View(resid)
			View(fitted)
## ANOVA
		model.se <- sqrt(sum(resid^2)/(nrow(data) - ncol(data)))
		beta.var <- model.se * inv.tX.X
		beta.var.k <- model.se * diag(beta.var)
		beta.se.k <- sqrt(beta.var.k)
## Print Results
			cat('Coefficients', '	', 'Standard Errors', '\n')
				for(i in 1:ncol(model.coef)){ # print the model coefficients
					cat('beta', i - 1, '=', model.coef[2,i], '	', beta.se.k[i, ], '\n')
				}
			cat('\n Average of the dependent:', y.mean, '\n', '\n', 'ANOVA: \n',
				'Model Standard Error:', model.se, '\n')
}



# test the linear regression
setwd('G:/QuantitativeMethods/RawData')
A <- read.csv('usgdp_R.csv', header = TRUE)

OLS <- lm(Y ~ C + I + G, data = A)
summary(OLS)
View(residuals(OLS))

eilerols(A[ ,2:5], 1)
