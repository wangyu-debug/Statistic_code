##eg1:weibull distribution
u = runif(10000)
lamda = 1/2 
k = 1/2
x1 = lamda*(-log(1-u))^(1/k)
hist(x1,prob = TRUE)
xx1 = seq(0,50,0.8)
lines(xx1,(k/lamda)*((xx1/lamda)^(k-1))*exp(-(xx1/lamda)^k))  # 绘制密度函数，与频数分布直方图的趋势作比较

##eg2:Cauthy distribution
u = runif(10000)
miu = 5
Sigma = 2
x2 = miu + Sigma*tan(pi*u - (pi/2))
hist(x2, breaks = 2500,xlim=c(-200,200),prob = TRUE)
xx2 = seq(-100,100,0.1)
lines(xx2,1/(pi*Sigma*(1+((xx2-miu)/Sigma)^2)))  # 绘制密度函数，与频数分布直方图的趋势作比较

##eg3:f(x)=(xx3/(Sigma2^2))*exp(-((xx3^2)/(2*(Sigma2^2))))
u = runif(10000)
Sigma2 = 2
x3 = (-2*(Sigma2^2)*log(1-(u/(Sigma2^2))))^(1/2)
hist(x3,xlim=c(-0.1,1.8),prob = TRUE)
xx3 = seq(0,1.5,0.01)
lines(xx3,(xx3/(Sigma2^2))*exp(-((xx3^2)/(2*(Sigma2^2)))))  # 绘制密度函数，与频数分布直方图的趋势作比较

##eg4: f(x) = xx4+1/2
u = runif(10000)
x4 = sqrt(2*u+1/4)-(1/2)
hist(x4,breaks = 50,xlim=c(0,1),prob = TRUE)
xx4 = seq(0,1,0.01)
lines(xx4,xx4+1/2)  # 绘制密度函数，与频数分布直方图的趋势作比较

##3.2
u1 = runif(500,0,0.5)
u2 = runif(500,0.5,1)
#### x>0  
x5 = -log(2*u1)
#### x<=0   
x6 = log(2-2*u2)
x = c(x5,x6)
hist(x,breaks = 50,prob = TRUE)
xx6 = seq(-6,65,0.01)
lines(xx6,(1/2)*exp(-abs(xx6)))  # 绘制密度函数，与频数分布直方图的趋势作比较



##3.3 
u = runif(10000)
x7 = 2/sqrt(1-u)
hist(x7,breaks =200,xlim = c(0,50),prob = TRUE)
xx7 = seq(0,20,0.1)
lines(xx7,4*(xx7^(-3)))  # 绘制密度函数，与频数分布直方图的趋势作比较

##3.5
#生成离散型分布函数随机数
u = runif(1000)
y1=integer(1000)   #初始化一个y1，用来放置离散概率函数的随机数，大小与均匀分布随机数保持一致
x = seq(0,4,1)     #离散型分布随机变量的可能取值
p = c(0.1,0.2,0.2,0.2,0.3)   
y1 [u>0 & u<=0.1] = 0   
y1 [u>0.1 & u<=0.3] = 1
y1 [u>0.3 & u<=0.5] = 2
y1 [u>0.5 & u<= 0.7] = 3
y1 [u>0.7 & u<1] = 4
b = table(y1)

##3.7
gamma_ = function(x){
  ans=1
  for(i in c(1:x)){
    ans = ans * i
  }
  return(ans)
}

Beta_ = function(x,a,b){
  temp = gamma_(a+b)/gamma_(a)/gamma_(b) * (x^(a-1) )* ((1-x)^(b-1))
  return(temp)
}

n <- 10000
k = 0
j = 0
y = numeric(n)
while (k<n) {
  u = runif(1)
  j = j+1
  x = runif(1)
  if(Beta_(x,3,2)>3*u){
    k = k+1
    y[k] = x
  }
}
j
hist(y,breaks =80, prob = TRUE)
y1 = seq(0,1,0.1)
lines(y1,Beta_(y1,3,2))


##3.4
sigma<-c(1,2,4,8,16,32)
for (i in 1:length(sigma)) {
  u = runif(10000)
  y = -log(u)
  x = sigma[i]*sqrt(y)
  hist(x,breaks = 80,prob=TRUE)
  xx = seq(0,6*sigma[i],length.out = 100000)
  y1<-(xx/sigma[i]^2)*exp(-(xx^2)/(2*sigma[i]^2))
  lines(xx,y1,col="steelblue")
}


##3.8
da = rnorm(1000)
da_ = exp(da)
hist(da_,prob=TRUE)
x <- seq(1,10, by = 1)
lines(dlnorm(x),col="red")
##3.11
n = 1000 
p1 = seq(0,1,0.05)
for (i in 1:length(p1)) {
  x1 = rnorm(p1[i]*1000,0,1)
  x2 = rnorm((1-p1[i])*1000,3,1)
  x = c(x1,x2)
  hist(x,breaks = 50,prob=TRUE)
}


##3.12
y = numeric(1000)
for (i in 1:1000) {
  lamda = rgamma(1,4,2)
  y[i] = rexp(1,lamda)
}
hist(y,breaks= 100,prob=TRUE)

##3.14
mu=c(0,1,2)
Sigma=matrix(c(1,-0.5,0.5,-0.5,1,-0.5,0.5,-0.5,1),ncol = 3,byrow = F)
rmvn.Choleski <-function(n, mu, Sigma) {
    d <- length(mu)
    Q <- chol(Sigma) # Choleski factorization of Sigma
    Z <- matrix(rnorm(n*d), nrow=n, ncol=d)
    X <- Z %*% Q + matrix(mu, n, d, byrow=TRUE)
    X
  }
X <- rmvn.Choleski(200, mu, Sigma)
# 绘图
pairs(X)







































