setwd("C:\\Users\\usrt\\Desktop\\Year 02 Sem 01\\PS\\PS Lab\\Lab 07")

# Problem 1: Uniform Distribution
prob_interval <- punif(25, min = 0, max = 40) - punif(10, min = 0, max = 40)

# Problem 2: Exponential Distribution
# Given the rate parameter (lambda)
lambda <- 1/3
probability <- pexp(2, rate = lambda, lower.tail = TRUE)

# Problem 3, Part i: Normal Distribution
# Given mean and standard deviation
mu <- 100
sigma <- 15

prob_above_130 <- 1 - pnorm(130, mean = mu, sd = sigma)

# Problem 3, Part ii: Normal Distribution

percentile_95 <- qnorm(0.95, mean = mu, sd = sigma)

