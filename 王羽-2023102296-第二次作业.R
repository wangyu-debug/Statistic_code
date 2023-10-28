##eg1:weibull distribution
u = runif(10000)
lamda = 1/2 
k = 1/2
x1 = lamda*(-log(1-u))^(1/k)
hist(x1,prob = TRUE)
xx1 = seq(0,50,0.8)
lines(xx1,(k/lamda)*((xx1/lamda)^(k-1))*exp(-(xx1/lamda)^k))  # 绘制密度函数，与频数分布直方图的趋势作比较

##eg2:Cauthy distribution













