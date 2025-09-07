
# IT2120 - Lab Sheet 

n <- 50
p <- 0.85


prob_q1 <- 1 - pbinom(46, size = n, prob = p)
prob_q1


### Q2. Call Center (Poisson distribution)
# Parameters
lambda <- 12


prob_q2 <- dpois(15, lambda = lambda)
prob_q2

