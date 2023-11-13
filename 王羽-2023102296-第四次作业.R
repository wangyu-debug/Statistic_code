###5.1###
m = 10000
x = runif(m,min = 0,max = pi/3)
theta.hat = mean(sin(x))*(pi/3)
theta.hat

###5.2###
cdf = function(x){
  m = 10000
  u = runif(m)
  cdf = numeric(length(x))
  for (i in 1:length(x)) {
    g = x[i] * exp(-(u*x[i])^2/2)
    cdf[i] = mean(g) / sqrt(2*pi) + 0.5
  }
  return(cdf)
}
x = seq(0.1,2.5,length=10)
result = cdf(x)
phi = pnorm(x)
print(round(rbind(x,result,phi),3))
##############计算Φ(2)########
fai2 = cdf(2)
fai2
##############95%置信区间###########
x = 2
m = 10000
z = rnorm(m)
g = (z<=x)
v = mean((g - mean(g))^2) / m
cdf = mean(g)
c(cdf,v)
c(cdf - 1.96 * sqrt(v),cdf + 1.96 * sqrt(v))


###5.3###
######Monte Carlo######
m = 10000
x = runif(m,min = 0,max = 0.5)
theta.hat = mean(exp(-x))*(0.5)
var1 = (0.5 ^ 2)*var(exp(-x))/m
var1
#######exponential distribution###
x = rexp(10000,1)
theta.hat_1 = sum(x<=0.5) / m
var2 = theta.hat_1*(1-theta.hat_1)/m
var2

###eg1###
miu = matrix(1,2,1)
sigma = matrix(c(1,0,0,1),2,2)
x1 = rnorm(1000,miu[1],sigma[1,1])
x2 = rnorm(1000,miu[2]+sigma[2,1]*(1/sigma[1,1])*(x1-miu[1]),sigma[2,2]-sigma[2,1]*(1/sigma[1,1])*sigma[1,2])
x = cbind(x1,x2)
x

###eg2###
##由x，y的边缘分布可知，F(x)F(y) = F(x,y),则x,y相互独立
##x ~ exp(2)  ,y ~ exp(2)
n = 1000
x = rexp(1000,2)
y = rexp(1000,2)
data = cbind(x,y)
data

###eg3###
######条件分布法#####
miu = matrix(1,2,1)
sigma = matrix(c(1,-0.5,-0.5,1),2,2)
x1 = rnorm(1000,miu[1],sigma[1,1])
x2 = rnorm(1000,miu[2]+sigma[2,1]*(1/sigma[1,1])*(x1-miu[1]),sigma[2,2]-sigma[2,1]*(1/sigma[1,1])*sigma[1,2])
x = cbind(x1,x2)
x
#############变换抽样法#######






#####eg4#####
data = matrix(NA,1000,3)
for (j in 1:1000) {
  u = runif(4)
  temp = 4/(3*pi)
  if(u[1]*temp<=temp){
    for (i in 1:3) {
      data[j,i] = 2 * u[1+i] - 1
    }
  }
}
data
