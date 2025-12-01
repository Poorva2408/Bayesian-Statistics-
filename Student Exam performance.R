# Analyzing student Exam performance
# Problem Statement: Analyzing the performance of 2 students on a MCQ exam with 40 questions 
# each having 4 choices.You suspect that both students have studied & will perform better than random guessing.n
# Student 1 scored 33/40 Questions right; student 2 scored: 24/40 Questions 
# 

# Step 1: Model Setup 
# X ~ Binomial (n, theta) ; theta = rate of success
# Likelihood function : L(theta | y) proportional to theta^x.(1-theta)^n-x
# Prior: Uniform Prior p ~ Beta(1,1)
# f(theta | y) ~ Beta (alpha + sum yi, Beta + n- sum yi) 

# Parameters of interest 
# theta 1 = true probability that student 1  will ans question correctly 
# theta 2 = true probability that student 2  will ans question correctly 

theta = seq(0, 1, 0.01)
#Plot prior B(1,1)
plot(theta, dbeta(theta, 1,1), type="l")

plot(theta, dbeta(theta, 4, 2), type="l")

# All mass moved beyond 0.25
plot(theta, dbeta(theta, 8, 4), type="l")

# prior probabilities using pbeta function for theta 1
1-pbeta(0.25, 8, 4) # 0.9988
1-pbeta(0.5, 8, 4)  # 0.8867
1-pbeta(0.8, 8, 4)  # 0.1611

# Posterior is Beta(alpha + sum yi, Beta + n - sum yi)
41 /(41+11) # Posterior mean 
33/40 # MLE

lines(theta, dbeta(theta, 41, 11))

# plot posterior first to get the right scale on the y- axis 

plot(theta, dbeta(theta, 41, 11), type="l")

# plot prior
lines(theta, dbeta(theta, 8, 4), lty=2)

# plot likelihood
lines(theta, dbinom(33, size=40, p=theta), lty=3)
# plot scaled likelihood
lines(theta, 44*dbinom(33, size=40, p=theta), lty=3)

# Posterior probabilities
1- pbeta(0.25, 41, 11) # 1
1- pbeta(0.5, 41, 11)  # 0.999
1- pbeta(0.8, 41, 11)  # 0.444

# EQUAL TAILED 95% Credible interval 
qbeta(0.025, 41, 11)
qbeta(0.975, 41, 11)

# Student 2 exam performance analysis 
# Beta (8+24, 4+40-24) = Beta(32, 20)
# find posterior mean and MLE 
# Posterior mean 
32 / (32 + 20) # 0.6153
# MLE 
24/40 # 0.6

# Plotting in order: posterior, prior, scaled likelihood
# posterior for s2 
plot(theta, dbeta(theta, 32, 20), type="l")
# prior
lines (theta, dbeta(theta, 8, 4), lty=2)
# scaled likelihood
lines (theta, 44*dbinom(24, size=40, p=theta), lty=3)

# Posterior probabilities
1 - pbeta(0.25, 32, 20) # 1
1 - pbeta(0.5, 32, 20) # 0.9540
1 - pbeta(0.8, 32, 20) # 0.001248

# 95% credible interval 
qbeta(0.025, 32, 20) # 0.4808
qbeta(0.975, 32, 20) # 0.7415

# Estimating probability of (theta1 > theta2)
# draw 1000 Samples from each & see how often we observe theta1 > theta2

theta1 = rbeta(1000, 41, 11)
theta2 = rbeta(1000, 32, 20)
mean(theta1> theta2)
# P(theta1 > theta2) = 0.979
# Result: student 1 has greater chance of scoring and student 2.








