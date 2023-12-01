###5.13 5.14
g <- function(x){
  (x^2 * exp(-(x^2)/2)/sqrt(2*pi))
}

m <- 10000
theta.hat <- se <- numeric(2)

x <- rexp(m,1)
fg <- g(x) / exp(-x)
theta.hat[1] <- mean(fg)
se[1] <- sd(fg)


u <- runif(m) 
x <- log(1-u*(1-exp(-1)))
fg <- g(x) / exp(-x)/((1-exp(-1))^(-1))
theta.hat[2] <- mean(fg)
se[2] <- sd(fg)

se #0.53827023 0.01964446
theta.hat #0.50519505 0.02556563








