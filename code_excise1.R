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



