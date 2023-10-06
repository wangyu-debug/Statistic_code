##2023-10-06 r语言练习题
###1. 创建[1,100]之间所有奇数组成的向量
odd_vec = seq(1,100,2)
odd_vec

###2. 将长度为200的数值型向量t中第5个元素删除，并在此位置中添加元素11和21
vec = seq(1,200)
length(vec)
vec = vec[-c(5)]  #删除第五个元素
vec = append(vec,11,after=4)
vec = append(vec,21,after=5)
vec

###3. 将1到24构成的自然数序列构建为行数为3、列数为4、组数为2的数组并访问第二组数据
y = c(1:24)
t = array(y,c(3,4,2))
print(t[,,2]) #访问第二组数据

###4. 定义一个4行5列的三维数组，数值为1:60, 行命名为c('R1','R2','R3','R4')，列命名为c('C1','C2','C3','C4','C5')，维度命名为c('T1','T2','T3')
y1 = c(1:60)
row_names = c('R1','R2','R3','R4')
col_names = c('C1','C2','C3','C4','C5')
dim_names = c('T1','T2','T3')
t1 = array(y1,c(4,5,3),dimnames = list(row_names,col_names,dim_names))
t1

###5. 根据下面给定的列，创建一个数据框，命名为ForeDataFrm
# > X = c(1,1,1)
# > Y = c(2,2,2)
# > temp = c(14.7,18.5,25.9)
# > RH = c(66,73,41)
# > wind = c(2.7,8.5,3.6)
# > rain = c(0,0,0)
# > area = c(0,0,0)
# > month = c('aug','aug','aug')
# > day = c('fri','fri','fri')
X = c(1,1,1)
Y = c(2,2,2)
temp = c(14.7,18.5,25.9)
RH = c(66,73,41)
wind = c(2.7,8.5,3.6)
rain = c(0,0,0)
area = c(0,0,0)
month = c('aug','aug','aug')
day = c('fri','fri','fri')
res = cbind(X,Y,temp,RH,wind,rain,area,month,day)
ForeDataFrm = data.frame(res)
ForeDataFrm


###6. 查看ForeDataFrm数据框的列名
col_name = colnames(ForeDataFrm)
col_name

###7. 判断ForeDataFrm是否是数据框类型
print(is.data.frame(ForeDataFrm))

###8. 访问ForeDataFrm数据框的第1列和第3列
col1 = ForeDataFrm[1]
col3 = ForeDataFrm[3]

###9. 访问ForeDataFrm中wind这一列
Fwind_ = ForeDataFrm["wind"]

###10. 判断a=123.4和b='123.4'是否为数值型，整数型，字符串型，逻辑型
a=123.4
b='123.4'
######数值型
print(is.numeric(a))
print(is.numeric(b))
######整数型
print(is.integer(a))
print(is.integer(b))
######字符串型
print(is.character(a))
print(is.character(b))
######逻辑型
print(is.logical(a))
print(is.logical(b))

###11. 查看向量a和b的数据类型
a=123.4
b='123.4'
print(class(a))
print(class(b))

###12. 将a转换为字符串类型，将b转换为浮点型
a=123.4
b='123.4'
a = as.character(a)
a
b = as.double(b)
b

###13. 将e = c(1:10)向量转换为矩阵
e = c(1:10)
e = as.matrix(e)
e

###14. 计算以2为底10的对数的平方根，并保留3位小数位数
out = round(sqrt(log(10,2)),3) 
out

###15. 计算向量y的和，累计和，连乘积
y = c(1:10)
sum1 = sum(y)
sum1  ##和
cumsum1 = cumsum(y)
cumsum1  ##累积和
cumprod1 = cumprod(y)
cumprod1  ##连乘积

### 16. 生成一个4行4列的单位矩阵
mat = diag(4)
mat

###17. 生成2个2行2列的矩阵m和n，一个值全是1，一个值全是2
m = matrix(1,2,2)
n = matrix(2,2,2)
m
n

###18. 计算矩阵m和矩阵n相乘后的结果mn，并输出正对角元素值
mn = m%*%n
mn
mn_diag = diag(mn)
mn_diag

###19. 以1:9按照行优先方式生成3行3列的矩阵mm，并求该矩阵的转置矩阵
mm = matrix(1:9,3,3,byrow = TRUE)
mm_t = t(mm)  #转置

###20. 求上一步生成的mm矩阵的特征值和特征向量
mm = matrix(1:9,3,3,byrow = TRUE)
eigen_mm = eigen(mm)
print(eigen_mm$values) #特征值
print(eigen_mm$vectors) #特征向量

###21. 分别使用repeat和for循环依次打印50以内的6的倍数
#####repeat循环
i = 6
repeat{ 
  if(i > 50) break 
  else {
    print(i)
    i = i + 6
    }
  }
#####for循环
for (i in 1:50) {
  if(i%%6==0){
    print(i)
  }else{
    next
  }
}

###22. 计算从1加到100，至少采用3种不同的方法
y2 = 1:100
######方法一
sum1 = sum(y2)
sum1
######方法二
sum2 = 0
for (i in 1:100) {
  sum2 = i + sum2
}
sum2
######方法二
i = 1
sum3 = 0
repeat{ 
  if(i > 100) break 
  else {
    sum3 = sum3 + i
    i = i + 1
  }
}
sum3

###23. 将y从小到大排序，然后用排好的值，做出其正态分布密度图
y = rnorm(1000, mean = 2, sd = 1)
y = sort(y)
y1 = dnorm(y,2,1)
plot(y, y1, type = "l", col="#f0932b", ylab = "Density", lwd=2, xlim = c(-2,6))

###24.	请利用R代码编写一函数程序如下，并计算F(5)，
#########F(n)=1^3+2^3+3^3+……+n^3by
sum_ <- function(n){
  sum1 = 0
  if(n>0&&n%%1==0){
     for (i in 1:n) {
      sum1 = i*(3^i) + sum1
     }
    return(sum1)
  }else{
    return("n输入错误，请重新输入n并重新执行程序")
  }
}
res = sum_(5.5)
res

###	用R来计算以下公式，并保留两位小数
res = (abs(exp(1)-(exp(2)^2)))^(1/3)
result = round(res,2)
result

### 27.	以1:6按照列的顺序生成2行3列的数据，并计算每行每列的最大最小值
mat = matrix(1:6,2,3)
mat = data.frame(mat)
#####列的最大值，最小值
max_col = apply(mat, 2, max) #最大值
min_col = apply(mat, 2, min) #最小值
#####行的最大值，最小值
max_row = apply(mat, 1, max) #最大值
min_row = apply(mat, 1, min) #最小值


