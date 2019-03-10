# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ # 
# Lecture : Data                       #
# 데이터의 유형을 한 번 다뤄보자       #
# Date    : August 27th, 2018
# Author  : jae hun Huh
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ #

#' 0827 Tip 정리
#' 이름을 지을 때 사용하는 방법: 가장 강추는 .을 찍는 방법
#' 더 예쁜 R coding을 하려면 ? --> google R code guide 참조
#' R에서는 상속 개념이 없고, 이름을 지을 때 단어와 단어 사이에 이름을 지을 때, 사용

# 1. Vector      ***** : 가장 중요
# 2. factor      ** 
# 3. Matrix      *     : 행렬과 같은 연산을 많이 할 때,
# 4. Array       *
# 5. Data.Frame  ***** : 가장 중요
# 6. List        ** 

# 1. Vector ----
# 데이터 분석의 가장 기본 단위
# 하나의 열로 구성되어 있음. 1차원 구조
# 하나의 데이터 유형만 가짐
# **데이터가 여러개의 유형일 경우, 우선순위가 높은 charater로 바뀜

#  1.1 vector 만들기 ----
#  1.1.(1) 하나의 값(element)으로 이루어진 벡터 ----

v1 <- 10
v2 <- "Lee"
v3 <- FALSE

# 1.1.(2) 두 개 이상의 값으로 이루어진 벡터 ----

# i. c(element, element2, ....)
# c : combine or concatenate 의 약자
# numeric, character, logical vector를 만듬
# 가지고 오고 싶은 열이 규칙이 없을 때 사용

age <- c(39, 20, 4)     # data: vector, type: numeric, element: 3
bt <- c("ab", "a", "a") 
marry <- c(TRUE, TRUE, FALSE)

c(1, "LEE", FALSE)
c(1, FALSE) # numeric

# ii. :
# numeric vector만 가능
# 1씩 증가되거나, 1씩 감소되는 숫자들로 구성된 벡터
# start:end
# start < end : 1씩 증가
# start > end : 1씩 감소
# start = end : start or end
# start 에 있는 숫자부터 시작해서 end에 있는 숫자를 넘지 않을 때 까지 1씩 증가 또는 1씩 감소

v1 <- 1:10

# iii. seq(from = , to = , by = )
# seq : sequence의 약자 -> :의 확장 
# numeric vector만 만듬
# from에 있는 숫자부터 시작해서, to에 있는 숫자를 넘지 않을때까지 by에 있는 숫자만크 증가 또는 감소

seq(from = 1, to = 5, by = 0.01)
seq(from = 5, to = 1, by = -0.1)


# 1.2 Vector의 속성(indexing) ----

# 1.2.(1) mode(vector) ----

# 1.2.(2) length(vector): element의 개수: 데이터의 개수 ----
length(age)

# 1.2.(3) names(vector) : element의 이름 ----

names(age) 
names(age)  <- c("이정환", "윤지원", "김동우") # vector의 이름을 제공
names(age) <- NULL                             # 기존의 이름을 제거

# Object = 객체, 개체
# 1. Data
# 2. Graph
# NULL: Object X

# 1.3 Vector의 Index ----
# 첫 번째를 1로 인식함, 일반적으로 다른 언어 같은 경우 0으로 시작

# 1.4 Vector의 Slicing(잘라 내는 것) ----

# vector[] : 대괄호가 나왔을 경우, slicing을 하는 것이라고 이해하면 됨
income <- c(10000, 15000, 1000, 20000, 500, 150)

income[1] # 1번째 것을 잘라내는 것
income[2]
income[6]

# 문제
# 1. 1, 4, 5번째 값을 한 번에 가져오세요

income[1, 4, 5]  # 에러, 다음과 같은 의미는 3차원을 의미. 따라서 c() 붙여주어야 함
income[c(1,4,5)] # 정답

# 문제
# 2~5번째 값을 한 번에 가져오세요

income[2:5]

# 문제
# 짝수 번째의 값을 한 번에 가져오세요

income[seq(from = 2, to = 6, by = 2)]
income[seq(from = 2, to = length(income), by = 2)]

# 1.5 Vector의 연산 ----
v1 <- 1:3
v2 <- 4:6
v1 + v2 # Vectorization *** 

# Vectorization : for문을 사용하지 않고 연산이 됨
# R은 최대한 for문을 사용하지 않음. R의 철학 중 하나

v3 <- 1:6
v1 + v3 # Recycling Rule ***

# Recycling Rule : v1 뒤에 값을 붙여서 사용

v4 <- 1:7
v1 + v4 # 같이 Recycling Rule이 적용되지만, warning 이 뜸
        # -> 완벽하게 recycling이 되지 않았기 때문에 warning이 뜸!


# 2. Factor ----
# 하나의 열로 구성되어 있음. 1차원 구조
# 하나의 데이터 유형만 가짐
# 집단으로 인식, 범주형 자료, 질적 자료

# 2.1 Factor 만들기 ----

factor(vector, labels = , levels = , ordered = ) 

# 3가지의 역할
# labels  = 각 factor 의 이름을 붙여줌
# levels  = factor에서 말하는 수준을 의미
# ordered = data에 ordering을 부여 

bt <- c("a", "o", "b", "b", "ab", "a", "a")
bt # 현재는 data가 vector이고 type이 character.


bt.factor <- 

bt.factor1 <- factor(bt)  

bt.factor2 <- factor(bt, 
                     labels = c("A형", "AB형", "B형", "O형")) # 만약 Levels 순서를 변경하고 싶다면, label 사용

bt.factor3 <-  factor(bt, 
                      labels = c("o", "ab", "b", "a"))

bt.factor4 <-  factor(bt,
                      labels = c("O형", "AB형", "B형", "A형"), # 이런식으로 하면, 나중에 정렬을 할 때 이 순서대로 할 수 있음
                      levels = c("o", "ab", "b", "a")
                      )

bt.factor5 <- factor(bt,  # ordered : 집단에 대해서 order를 주는 것
                     labels = c("O형", "AB형", "B형", "A형"),  
                     levels = c("o", "ab", "b", "a"),
                     ordered = TRUE
                     )


# 2.2 Factor의 속성 ----
# (1) levels(factor): 집단의 이름과 개수가 어떻게 되는지 알려줌
levels(bt.factor5)

# 3. Matrix ----
# 행과 열로 구성되어 있음, 2차원 구조
# 하나의 데이터 유형만 가짐
# vectorization, Recycling Rule 적용 됨

# 3.1 Matrix 만들기 ----
# (1) rbind(vector1, vector2, ...) # r -> row
v1 <- 1:3
v2 <- 4:7

v1v2.r <- rbind(v1, v2) # 2 by 3 matrix

# (2) cbind(vector1, vector2, ...) # c -> column

v1v2.c <- cbind(v1, v2)

# (3) matrix(vector, nrow = , ncol =, byrow = )

matrix(1:4, nrow = 3, ncol = 3) # 값이 들어갈 때, 열 순서로 들어감. 빈 공간에는 Recycling Rule 적용
matrix(1:4, nrow = 3, ncol = 3, byrow = TRUE) # byrow -> T  : 행 순서로 들어감

# 3.2 Matrix의 연산 ----
# 특별하지 않으면, 대문자로 matrix 명 만듬
# (1) 덧셈: +
A <- matrix(1:4, nrow = 2, ncol  = 2)
B <- matrix(5:8, nrow = 2, ncol  = 2)
C <- matrix(1:2, nrow = 1, ncol = 2)
A + B

# (2) 곱셈 : %*%
A %*% B 

# (3) 역행렬 : solve(matrix)
# 역행렬을 구할 때, 연립 방정식을 구할 때, 굉장히 좋음.
# 데이터 분석의 핵심은 행렬! ex) 이미지 분석
solve(A)

# (4) 전치행렬: t(matrix)
t(A)

# 4. array ----
# 3차원 이상을 만들 수 있음
# ex) 공간 데이터, x, y, z축을 의미
# 하나의 데이터 유형만 가짐

# 4.1 Array 만들기 ----
# array(vecto, dim = ) dim 의 setting에 따라서 차원이 달라짐

array(1:10, dim = 10) # 1차원 구조
array(1:10, dim = 20) # 1차원 구조 + recycling Rule 이 적용됨 
array(1:10, dim = c(2,5)) # 2차원 구조
test2 <- array(1:10, dim = c(2,5,2)) # 3차원 구조

# 5. Data.Frame ----
# 가장 대표적인 데이터. 
# 행과 열로 구성되어 있음. 2차원 구조
# 여러 개의 데이터 유형을 가질 수 있음

# 5.1 Data.Frame 만들기 ----
# data.frame(vector, factor, matrix)
id <- 1:7
dep <- c("사업부", "SF", "대외사업부", "EIC", "기술서비스", "기술서비스", "글로벌추진단")
cyear <- c(12, 7, 3, 7, 0.5, 1, 12)

posco <- data.frame(id, dep, cyear)
posco[,1, drop = FALSE] # *** drop parameter : dataFrame의 형태를 그대로 유지

# 6. List ----
# 가장 유연한 형태의 데이터
# 데이터분석의 결과물을 저장
# 1차원 구조

# 6.1 List 만들기 ----
# list(vector, factor, matrix, array, data.frame, list)
# 대괄호가 무조건 2개가 나왔다고 하면, list 라는 것을 알 수 있음

result <- list(id, A, posco)
result

# 6.2 List의 slicing ----
# 두 개의 차이점 인식하기
# (1) list[index]
# (2) list[[index]]

result[1]    # list 
result[[1]]  # vector

result[2]    # list 
result[[2]]  # matrix 

result[3]    # list 
result[[3]]  # Data.Frame
