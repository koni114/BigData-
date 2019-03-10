# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ # 
# Lecture : Data Handling = Data Preprocessing            #
#                                                         #
# Date    : August 27th, 2018                             #
# Author  : jae hun Huh                                   #
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ #

# Data Handling -> 70 ~ 80% 정도 시간 소요
# 정형 Data만 다루기로 함

# ggplot2 package 사용 : Data Visualization 에 대명사지만, 내부 Data를 사용하기 위하여 사용

# 패키지 설치하기와 로딩하기
install.packages("ggplot2") # grammer grahic 의 줄임말 : gg
install.packages("DT")
install.packages("dplyr")

# ** package 설치시 나오는 문구
# The following object is masked from ‘package:ggplot2’: vars 의 의미는,
# ggplot2에 있는 vars 함수 명이 겹친다 라는 의미!



library(ggplot2)
library(DT)
library(dplyr)


# 작업 공간: 다른 script로 옴겨갈 때를 대비하여 항상 작업 공간 setting 작업을 수행하는 것이 중요
setwd("d:POSCOICT/")

# 데이터 불러오기
# 만약 실전 Data가 있다면, read.csv 등을 이용하여 불러와 ㅎ함
# 현재는 실전 Data가 없기 때문에 예제 데이터 사용

# 1. 데이터 전체 보기 ----
# 1.1 data        : console에 출력됨 ----

diamonds # tibble 도 dataFrame 

# 1.2 View(data)  : Editor windows에 출력됨 ----
View(diamonds)

# 2. 데이터의 일부 보기 ----
# 2.1 head(data, n = 6) ----
head(diamonds, n = 6) # default : 6
head(diamonds, n = 20)

# 2.2 tail(data, n = 6)
tail(diamonds, n = 20)

# head, tail을 통해 data가 잘 읽혀 왔는지 check

# 2.3 DT::datatable(data)

DT::datatable(head(diamonds, n = 20))

# ** 2.1, 2.2는 콘솔에 출력됨. but datatable은 web style 로 출력 됨
# ** 실제로 분석할 때 알아야 할 package 는 50개 정도면 됨
# ** 외부데이터를 가져오면 기본적으로 dataFrame 형태로 setting

# 3. 데이터의 구조(structure) 보기 ----
# str(data)

str(diamonds) # tbl : table의 약자

# 4. 데이터의 기술통계량 ----
# 데이터의 오류가 있는지 check 체크함

# summary(data)
# 실제로 Data에 대한 코드 표가 있음. -> 이것을 보고 참고할 필요성이 있음
# 

summary(diamonds)

# 5. 데이터의 속성 ----
# 5.1 행의 개수 : nrow(data) ----

nrow(diamonds)

# 5.2 열 = 변수의 개수 : ncol(data) ----

ncol(diamonds)

# 5.3 행의 이름 : rownames(data) ----
# data를 외부에서 가져오면 일련 번호를 문자로 바꾸어서 setting 됨

rownames(diamonds)

# 5.4 열의 이름 : 변수의 이름 ----

colnames(diamonds)[]

# 5.5 차원(dimension) : dim(data) ----
# 행의 개수와 열의 개수

dim(diamonds)
dim(diamonds)[1] # 행의 개수
dim(diamonds)[2] # 열의 개수

# 5.6 차원의 이름 : dimnames(data) ----

dimnames(diamonds)      # --> list 꺾새가 나왔기 때문
dimnames(diamonds)[1]   # --> list, 행의 이름
dimnames(diamonds)[[1]] # --> Vector, 열의 이름 

# 6. 데이터의 slicing ----
# data[rowIndex, colIndex]

# 6.1 열
# (1) 열의 위치를 알 때
# data[ , colIndex]
diamonds[ , 1] # carat:
diamonds[ , 2] # cut: diamond의 품질

# 문제
# 1, 9, 10 번째 열을 한 번에 가져오세요.
diamonds[, c(1, 9, 10)]


# 6.2 3 ~ 8번째 열을 한 번에 가져오세요.
diamonds[ , 3:8]

# 문제
# 홀수 번째 열을 한 번에 가져오세요
diamonds[, seq(from =  1, to = ncol(diamonds), by = 2)]

# (2) 열의 이름을 알 때
diamonds[ , "carat"]
diamonds[ , "cut"]

# x, y, z라는 변수명을 가지는 데이터를 가져오세요
diamonds[ , c("x", "y", "z")]

# (3) 열 = 변수 이름의 패턴이 있을 때
# ** grep("pattern", characterVector, value = FALSE) # : 위치 index return
# ** grep("pattern", characterVector, value = TRUE)  # : 변수명 return

# i. 변수명에 c라는 글자를 포함하고 있는 경우 컬럼 출력 ----

grep("c", colnames(diamonds), value = FALSE) 
grep("c", colnames(diamonds), value = TRUE)

diamonds[ , grep("c", colnames(diamonds), value = FALSE)]
diamonds[ , grep("c", colnames(diamonds), value = TRUE)]

# ii. 변수명이 c로 시작하는 경우 ----

grep("^c", colnames(diamonds), value = TRUE)
diamonds[ , grep("^c", colnames(diamonds), value = TRUE)]

# iii. 변수명이 특정한 문자로 끝나는 경우 ----
# 변수명이 e로 끝나는 경우
# grep("e$", colnames(diamonds), value = TRUE)

# (4) dplyr::select(data, variable)

dplyr::select(diamonds, carat)
dplyr::select(diamonds, carat, cut) # 2개 컬럼 select
dplyr::select(diamonds, x:z)        # x 부터 z까지의 컬럼 위치 값들을 제공
dplyr::select(diamonds, -(x:z))     # x,y,z 빼고 나머지 다 select
































