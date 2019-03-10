# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ # 
# Lecture : Data                       #
# �������� ������ �� �� �ٷﺸ��       #
# Date    : August 27th, 2018
# Author  : jae hun Huh
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ #

#' 0827 Tip ����
#' �̸��� ���� �� ����ϴ� ���: ���� ���ߴ� .�� ��� ���
#' �� ���� R coding�� �Ϸ��� ? --> google R code guide ����
#' R������ ��� ������ ����, �̸��� ���� �� �ܾ�� �ܾ� ���̿� �̸��� ���� ��, ���

# 1. Vector      ***** : ���� �߿�
# 2. factor      ** 
# 3. Matrix      *     : ��İ� ���� ������ ���� �� ��,
# 4. Array       *
# 5. Data.Frame  ***** : ���� �߿�
# 6. List        ** 

# 1. Vector ----
# ������ �м��� ���� �⺻ ����
# �ϳ��� ���� �����Ǿ� ����. 1���� ����
# �ϳ��� ������ ������ ����
# **�����Ͱ� �������� ������ ���, �켱������ ���� charater�� �ٲ�

#  1.1 vector ����� ----
#  1.1.(1) �ϳ��� ��(element)���� �̷���� ���� ----

v1 <- 10
v2 <- "Lee"
v3 <- FALSE

# 1.1.(2) �� �� �̻��� ������ �̷���� ���� ----

# i. c(element, element2, ....)
# c : combine or concatenate �� ����
# numeric, character, logical vector�� ����
# ������ ���� ���� ���� ��Ģ�� ���� �� ���

age <- c(39, 20, 4)     # data: vector, type: numeric, element: 3
bt <- c("ab", "a", "a") 
marry <- c(TRUE, TRUE, FALSE)

c(1, "LEE", FALSE)
c(1, FALSE) # numeric

# ii. :
# numeric vector�� ����
# 1�� �����ǰų�, 1�� ���ҵǴ� ���ڵ�� ������ ����
# start:end
# start < end : 1�� ����
# start > end : 1�� ����
# start = end : start or end
# start �� �ִ� ���ں��� �����ؼ� end�� �ִ� ���ڸ� ���� ���� �� ���� 1�� ���� �Ǵ� 1�� ����

v1 <- 1:10

# iii. seq(from = , to = , by = )
# seq : sequence�� ���� -> :�� Ȯ�� 
# numeric vector�� ����
# from�� �ִ� ���ں��� �����ؼ�, to�� �ִ� ���ڸ� ���� ���������� by�� �ִ� ���ڸ�ũ ���� �Ǵ� ����

seq(from = 1, to = 5, by = 0.01)
seq(from = 5, to = 1, by = -0.1)


# 1.2 Vector�� �Ӽ�(indexing) ----

# 1.2.(1) mode(vector) ----

# 1.2.(2) length(vector): element�� ����: �������� ���� ----
length(age)

# 1.2.(3) names(vector) : element�� �̸� ----

names(age) 
names(age)  <- c("����ȯ", "������", "�赿��") # vector�� �̸��� ����
names(age) <- NULL                             # ������ �̸��� ����

# Object = ��ü, ��ü
# 1. Data
# 2. Graph
# NULL: Object X

# 1.3 Vector�� Index ----
# ù ��°�� 1�� �ν���, �Ϲ������� �ٸ� ��� ���� ��� 0���� ����

# 1.4 Vector�� Slicing(�߶� ���� ��) ----

# vector[] : ���ȣ�� ������ ���, slicing�� �ϴ� ���̶�� �����ϸ� ��
income <- c(10000, 15000, 1000, 20000, 500, 150)

income[1] # 1��° ���� �߶󳻴� ��
income[2]
income[6]

# ����
# 1. 1, 4, 5��° ���� �� ���� ����������

income[1, 4, 5]  # ����, ������ ���� �ǹ̴� 3������ �ǹ�. ���� c() �ٿ��־�� ��
income[c(1,4,5)] # ����

# ����
# 2~5��° ���� �� ���� ����������

income[2:5]

# ����
# ¦�� ��°�� ���� �� ���� ����������

income[seq(from = 2, to = 6, by = 2)]
income[seq(from = 2, to = length(income), by = 2)]

# 1.5 Vector�� ���� ----
v1 <- 1:3
v2 <- 4:6
v1 + v2 # Vectorization *** 

# Vectorization : for���� ������� �ʰ� ������ ��
# R�� �ִ��� for���� ������� ����. R�� ö�� �� �ϳ�

v3 <- 1:6
v1 + v3 # Recycling Rule ***

# Recycling Rule : v1 �ڿ� ���� �ٿ��� ���

v4 <- 1:7
v1 + v4 # ���� Recycling Rule�� ���������, warning �� ��
        # -> �Ϻ��ϰ� recycling�� ���� �ʾұ� ������ warning�� ��!


# 2. Factor ----
# �ϳ��� ���� �����Ǿ� ����. 1���� ����
# �ϳ��� ������ ������ ����
# �������� �ν�, ������ �ڷ�, ���� �ڷ�

# 2.1 Factor ����� ----

factor(vector, labels = , levels = , ordered = ) 

# 3������ ����
# labels  = �� factor �� �̸��� �ٿ���
# levels  = factor���� ���ϴ� ������ �ǹ�
# ordered = data�� ordering�� �ο� 

bt <- c("a", "o", "b", "b", "ab", "a", "a")
bt # ����� data�� vector�̰� type�� character.


bt.factor <- 

bt.factor1 <- factor(bt)  

bt.factor2 <- factor(bt, 
                     labels = c("A��", "AB��", "B��", "O��")) # ���� Levels ������ �����ϰ� �ʹٸ�, label ���

bt.factor3 <-  factor(bt, 
                      labels = c("o", "ab", "b", "a"))

bt.factor4 <-  factor(bt,
                      labels = c("O��", "AB��", "B��", "A��"), # �̷������� �ϸ�, ���߿� ������ �� �� �� ������� �� �� ����
                      levels = c("o", "ab", "b", "a")
                      )

bt.factor5 <- factor(bt,  # ordered : ���ܿ� ���ؼ� order�� �ִ� ��
                     labels = c("O��", "AB��", "B��", "A��"),  
                     levels = c("o", "ab", "b", "a"),
                     ordered = TRUE
                     )


# 2.2 Factor�� �Ӽ� ----
# (1) levels(factor): ������ �̸��� ������ ��� �Ǵ��� �˷���
levels(bt.factor5)

# 3. Matrix ----
# ��� ���� �����Ǿ� ����, 2���� ����
# �ϳ��� ������ ������ ����
# vectorization, Recycling Rule ���� ��

# 3.1 Matrix ����� ----
# (1) rbind(vector1, vector2, ...) # r -> row
v1 <- 1:3
v2 <- 4:7

v1v2.r <- rbind(v1, v2) # 2 by 3 matrix

# (2) cbind(vector1, vector2, ...) # c -> column

v1v2.c <- cbind(v1, v2)

# (3) matrix(vector, nrow = , ncol =, byrow = )

matrix(1:4, nrow = 3, ncol = 3) # ���� �� ��, �� ������ ��. �� �������� Recycling Rule ����
matrix(1:4, nrow = 3, ncol = 3, byrow = TRUE) # byrow -> T  : �� ������ ��

# 3.2 Matrix�� ���� ----
# Ư������ ������, �빮�ڷ� matrix �� ����
# (1) ����: +
A <- matrix(1:4, nrow = 2, ncol  = 2)
B <- matrix(5:8, nrow = 2, ncol  = 2)
C <- matrix(1:2, nrow = 1, ncol = 2)
A + B

# (2) ���� : %*%
A %*% B 

# (3) ����� : solve(matrix)
# ������� ���� ��, ���� �������� ���� ��, ������ ����.
# ������ �м��� �ٽ��� ���! ex) �̹��� �м�
solve(A)

# (4) ��ġ���: t(matrix)
t(A)

# 4. array ----
# 3���� �̻��� ���� �� ����
# ex) ���� ������, x, y, z���� �ǹ�
# �ϳ��� ������ ������ ����

# 4.1 Array ����� ----
# array(vecto, dim = ) dim �� setting�� ���� ������ �޶���

array(1:10, dim = 10) # 1���� ����
array(1:10, dim = 20) # 1���� ���� + recycling Rule �� ����� 
array(1:10, dim = c(2,5)) # 2���� ����
test2 <- array(1:10, dim = c(2,5,2)) # 3���� ����

# 5. Data.Frame ----
# ���� ��ǥ���� ������. 
# ��� ���� �����Ǿ� ����. 2���� ����
# ���� ���� ������ ������ ���� �� ����

# 5.1 Data.Frame ����� ----
# data.frame(vector, factor, matrix)
id <- 1:7
dep <- c("�����", "SF", "��ܻ����", "EIC", "�������", "�������", "�۷ι�������")
cyear <- c(12, 7, 3, 7, 0.5, 1, 12)

posco <- data.frame(id, dep, cyear)
posco[,1, drop = FALSE] # *** drop parameter : dataFrame�� ���¸� �״�� ����

# 6. List ----
# ���� ������ ������ ������
# �����ͺм��� ������� ����
# 1���� ����

# 6.1 List ����� ----
# list(vector, factor, matrix, array, data.frame, list)
# ���ȣ�� ������ 2���� ���Դٰ� �ϸ�, list ��� ���� �� �� ����

result <- list(id, A, posco)
result

# 6.2 List�� slicing ----
# �� ���� ������ �ν��ϱ�
# (1) list[index]
# (2) list[[index]]

result[1]    # list 
result[[1]]  # vector

result[2]    # list 
result[[2]]  # matrix 

result[3]    # list 
result[[3]]  # Data.Frame