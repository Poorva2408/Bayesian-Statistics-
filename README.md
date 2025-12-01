# Bayesian-Statistics-
Analysing Student Exam Performance  using Beta - Binomial conjugate analysis

Analysing performance of student on a MCQ test with 40 questions, each having 4 choices given that both of the students have studied and will perform better than random guessing. 
student 1 scored 33/40 questions right.
student 2 scored 24/40 questions right. 

Steps to perform analysis:
1. What are our parameters of interest ?
   theta1 = true probability that student 1 will answer a question correctly
   theta2 = true probability that student 2 will answer a question correctly 
2. what is likelihood ?
   Binomial (40, theta), if we assume that each question is independent and that a probability a student gets each question right is the same for all questions for that student
3. What prior should we use?
   Beta conjugate prior
4. what is the prior probability that theta is greater than one quarter which would be guessing randomly (theta > 0.5 or theta > 0.8)

5. Plot the graphs : posterior, prior, likelihood
6. Find posterior probability that theta > 0.25, 0.5, 0.8
7. Find 95% posterior credible interval for theta 1.
8. Theta 2 : success rate of student 2: perform step 4 to 7 on theta 2.
9. compare success rates of student 1 and student 2 : Probability of (theta 1 > theta 2)

# Results 
Student 1 Exam performance : 
1. prior probabilities : theta1 > 0.25 : 0.998; theta1 > 0.5 : 0.8867; theta1 > 0.8: 0.1611
2. Prior selection:  Beta (1,1) :uniform prior  -> Beta( 8, 4) (All mass > 0.25) 
3. posterior probabilities : theta1 > 0.25: 1; theta1> 0.5 : 0.9999; theta1 > 0.8: 0.444
4. poterior Beta (33+8, 40+4-33) = Beta (41, 11)
5. posterior mean = 0.788
6. Maximum likelihood  Estimate = 33/40 = 0.825
7. 95 % Credible interval = (0.668, 0.887)
8. Plot:

   <img width="567" height="492" alt="theta1" src="https://github.com/user-attachments/assets/9241568d-3409-426f-98c2-08c292fcd105" />


Student 2 Exam performance :
1. Posterior Beta (8+24, 4+40-24), Beta(32, 20)
2. Posterior mean = 0.6153
3. Maximum Likelihood Estimate = 24/40 = 0.6
4. Posterior Probabilities: theta2 > 0.25: 1; theta2 > 0.5:0.954 ; theta2 > 0.8: 0.0012 ;
5. 95 % Credible interval (0.4808, 0.7415)
6. Plot:
   
   <img width="582" height="502" alt="theta2" src="https://github.com/user-attachments/assets/537f40ac-5ef6-46a6-832e-21871316b68b" />

   
Performance comparison:
After 1000 samples, success rate of student 1 (theta1) > success rate of student 2 (theta2) : mean= P(theta1 > theta2) = 0.979

Conclusion: Student 1 has better chance of scoring than student 2. 



## Beta Binomial Conjugate analysis 

📊 Beta-Binomial Conjugate AnalysisThis analysis represents the classic foundation of Bayesian inference for estimating an unknown probability or proportion ($p$). It leverages the mathematical compatibility (conjugacy) between the Beta prior and the Binomial likelihood to provide a simple, closed-form solution for the posterior distribution.

Term,Symbol,Role
Parameter,p,The unknown true probability of success (our target of estimation).
Observed Data,x successes out of n trials,The evidence gathered from the experiment.
Prior Parameters,"α,β","Initial beliefs, often called pseudo-counts of successes and failures."

📐 Mathematical Model1. 
The Likelihood Function (Data Model)The data are assumed to follow a Binomial distribution, where $n$ and $x$ are known, and $p$ is the variable we are solving for:
📊 Beta-Binomial Conjugate AnalysisThis analysis is the cornerstone of Bayesian inference for estimating an unknown probability or proportion ($p$). It utilizes the mathematical compatibility (conjugacy) between the Beta prior and the Binomial likelihood to provide a simple, closed-form solution for the posterior distribution.

🔑 Core Model Components
    Component,Symbol,Role,Distribution Range
    Parameter (Target),p,The unknown true probability of success.,"[0,1]"
    Observed Data,x successes out of n trials,The evidence gathered from the experiment.,"x∈{0,1,…,n}"
    Prior Parameters,"α,β","Initial beliefs, often called pseudo-counts.","α,β>0"

    1. The Mathematical ModelA.
    2. The Likelihood Function (Data Model)The data is assumed to follow a Binomial distribution, where n and x are known:
       Data X ~ Binomial (n, p)
       The Likelihood function L(p | x) is proportional to:L(p | x) \propto p^x (1-p)^{n-x}

## The Prior Distribution

    The Beta distribution is the conjugate prior for $p$:
    $$\text{Prior } p \sim \text{Beta}(\alpha, \beta)$$
    The PDF of the Beta prior is proportional to:$$f(p) \propto p^{\alpha - 1} (1-p)^{\beta - 1}$$2.

# Bayes' Theorem and The Posterior Result
    Due to the conjugate property, the posterior distribution is also a Beta distribution.
    $$\text{Posterior} \propto \text{Likelihood} \times \text{Prior}$$

    The final posterior distribution for $p$ is obtained by adding the observed data
    ($x$ and $n-x$) to the prior pseudo-counts:$$\text{Posterior } p | x \sim \text{Beta}(\alpha', \beta')$$
    Where the new parameters are:
    New Successes ($\alpha'$): alpha' = alpha + xNew Failures ($\beta'$): beta' = beta + (n - x)3. 

## Key Advantages and Interpretation
Feature Description
1. Analytical Tractability Provides a closed-form solution (the Beta posterior), eliminating the need for complex numerical methods (like MCMC).
2. Intuitive Updating The parameters $\alpha'$ and $\beta'$ are the total equivalent successes and failures (prior + observed).
3. Posterior Mean (Estimate)
    The most common point estimate for $p$ is the posterior mean, which balances the prior and the data: 
    `E(pCredible IntervalsIntervals derived from the posterior Beta distribution provide a direct probability statement: 
    "There is a 95% probability that the true proportion $p$ lies within this range."

🛠️ Practical Application 
This model is the foundational Bayesian method for estimating proportions in diverse fields:
1. A/B Testing: Estimating the true conversion rate or click-through rate (CTR).
2. Quality Control: Estimating product defect rates.
3. Sequential Analysis (MAB): Forms the core of the Thompson Sampling algorithm for multi-armed bandit problems.
