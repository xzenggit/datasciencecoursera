# This is for Statistical Inference Projcet 1
# Investigate the exponential distribution in R and compare it with the Central Limit Theorem.

set.seed(12345)

# set lamda for the exponential distribution
lamda <- 0.2

# set random sampel number n and avearge number m 
n <- 1000
m <- 40

# distribution of n random exponential distribution
hist(rexp(n, lamda), breaks=40,
      xlab="Expotential number", ylab="Frequency",
      main="Histogam of exponential distribution")

# distribution of n averages of m random exponentials & compare the mean
mns = NULL
for (i in 1:n) {
  mns = c(mns, mean(rexp(m, lamda)))
}
hist(mns, breaks=40, xlab="Expotential number", ylab="Frequency",
     main="Histogam of average 40 exponential distribution")
abline(v=mean(mns),col="red", lwd=2)
abline(v=1/lamda, col="blue", lwd=2)
legend("topright",c("Sample mean", "Theoretical mean"), col=c("red","blue"),
       lty=c(1,1))

# compare the variance
hist(mns, breaks=40, xlab="Expotential number", ylab="Frequency",
     main="Histogam of average 40 exponential distribution")
abline(v=mean(mns)-sd(mns),col="red", lwd=2)
abline(v=mean(mns)+sd(mns),col="red", lwd=2)
abline(v=mean(mns)-1/lamda/sqrt(m), col="blue", lwd=2)
abline(v=mean(mns)+1/lamda/sqrt(m), col="blue", lwd=2)
legend("topright",c("Sample STD", "Theoretical STD"), col=c("red","blue"),
       lty=c(1,1))


# density distribution of sample and theoretical results
hist(mns, breaks=40, prob=TRUE, xlab="Expotential number", ylab="Density",
     main="Histogam of average 40 exponential density")
lines(density(mns),col="red")
lines(seq(min(mns),max(mns),length=n),
      dnorm(seq(min(mns),max(mns),length=n),mean=1/lamda,sd=1/lamda/sqrt(m)),col="blue")
legend("topright",c("Sample density", "Theoretical density"), col=c("red","blue"),
       lty=c(1,1))

# qqplot
qqnorm(mns, main="QQ plot")
qqline(mns, col="red")


