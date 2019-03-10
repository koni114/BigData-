#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : Basis Data Analysis                        #
#                                                      #
# Date    : August 28th, 2018                          #
# Author  : Buil Lee                                   #
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#

# 패키지 설치하기와 로딩하기
install.packages("ggplot2")
install.packages("RColorBrewer")
install.packages("stringr")
install.packages("prettyR")
install.packages("e1071")
install.packages("psych")
library(ggplot2)
library(RColorBrewer)
library(stringr)
library(prettyR)
library(e1071)
library(psych)


# 작업공간
setwd("c:/POSCOICT/")


# 데이터 불러오기


# 데이터명 : diamonds
# 변수명   : "carat", "cut", "color",  "clarity", "depth", "table",
#            "price", "x", "y", "z"

# 자료의 종류
# 1. 질적 자료 : cut, color, clarity
# 2. 양적 자료 : carat, depth, table, price, x, y, z

# 탐색적 자료 분석(EDA : Exploratory Data Analysis)

# 1. 일변량(Uni-variate = 하나의 변수 = 하나의 열) 질적 자료의 분석----
# 1.1 표 = 빈도표(빈도, 백분율)
# (1) 빈도(Frequency)
# table(data$variable)
table(diamonds$cut)
sort(table(diamonds$cut) , decreasing = TRUE)


# (2) 백분율(Percent)
# prop.table(frequency) : 비율 = 0 ~ 1
# prop.table(frequency)*100 : 백분율 = 0 ~ 100
prop.table(table(diamonds$cut))*100
sort(prop.table(table(diamonds$cut))*100 , decreasing = TRUE)
round(sort(prop.table(table(diamonds$cut))*100 , decreasing = TRUE) , digits = 1)


for(i in 2:4){
  print(sort(table(diamonds[ , i]) , decreasing = TRUE))
  print(round(sort(prop.table(table(diamonds[ , i]))*100 , decreasing = TRUE) , digits = 1))
}


# 1.2 그래프 : 막대그래프, 원그래프
# (1) 막대그래프
# barplot(frequency or percent) : 세로 막대그래프
barplot(sort(table(diamonds$cut) , decreasing = TRUE))

# 막대 색깔 : col = "color"
barplot(sort(table(diamonds$cut) , decreasing = TRUE),
        col = "blue")

barplot(sort(table(diamonds$cut) , decreasing = TRUE),
        col = "darkorchid")

barplot(sort(table(diamonds$cut) , decreasing = TRUE),
        col = c("blue", "red", "skyblue", "purple", "black"))

barplot(sort(table(diamonds$cut) , decreasing = TRUE),
        col = c("red", "blue"))

color.palette <- RColorBrewer::brewer.pal(n = 5, name = "BrBG")
barplot(sort(table(diamonds$cut) , decreasing = TRUE),
        col = color.palette)

# 제목 : main = "title"
barplot(sort(table(diamonds$cut) , decreasing = TRUE),
        col  = color.palette,
        main = "Cut of Diamonds")

# y축 제목 : ylab = "y's axis title"
# ylab     : y label의 약자
barplot(sort(table(diamonds$cut) , decreasing = TRUE),
        col  = color.palette,
        main = "Cut of Diamonds",
        ylab = "Frequency")

# y축 눈금 : ylim = c(min, max)
# ylim     : y limit의 약자
barplot(sort(table(diamonds$cut) , decreasing = TRUE),
        col  = color.palette,
        main = "Cut of Diamonds",
        ylab = "Frequency",
        ylim = c(0, 25000))

# 가로 막대그래프 : horiz = TRUE
# horiz           : horizontal의 약자
barplot(sort(table(diamonds$cut) , decreasing = FALSE),
        col  = color.palette,
        main = "Cut of Diamonds",
        xlab = "Frequency",
        xlim = c(0, 25000),
        horiz = TRUE)

# 문제
# cut, color, clarity에 대한 막대그래프를 작성하시오.
for(i in 2:4){
  barplot(sort(table(diamonds[ , i]) , decreasing = FALSE),
          col  = color.palette,
          main = paste(stringr::str_to_title(colnames(diamonds)[i]), "of Diamonds"),
          xlab = "Frequency",
          xlim = c(0, 25000),
          horiz = TRUE)
}

paste(1, "Lee")
paste(1, 1)
paste(1, 1, sep = "-")
paste("cut", "of Diamonds")
colnames(diamonds)[2]
colnames(diamonds)[3]
colnames(diamonds)[4]
paste(colnames(diamonds)[2], "of Diamonds")

words <- "Love is choice."
stringr::str_to_lower(words)
stringr::str_to_upper(words)
stringr::str_to_title(words)
paste(stringr::str_to_title(colnames(diamonds)[i]), "of Diamonds")


# (2) 원그래프
# pie(frequency or percent)
pie(sort(table(diamonds$cut) , decreasing = TRUE))
pie(sort(table(diamonds$cut) , decreasing = TRUE),
    col = color.palette)

# 반지름 : radius = 0.8
pie(sort(table(diamonds$cut) , decreasing = TRUE),
    col    = color.palette,
    radius = 1)

# 시계방향 : clockwise = TRUE
pie(sort(table(diamonds$cut) , decreasing = TRUE),
    col       = color.palette,
    radius    = 1,
    clockwise = TRUE)

# 첫째 조각의 시작 각도 : init.angle = 
# (1) 반시계방향 : 0
# (2) 시계방향   : 90
pie(sort(table(diamonds$cut) , decreasing = TRUE),
    col        = color.palette,
    radius     = 1,
    clockwise  = TRUE,
    init.angle = 0)

# 문제
# cut, color, clarity에 대한 막대그래프와 원그래프를 
# 작성하시오.
for(i in 2:4){
  barplot(sort(table(diamonds[ , i]) , decreasing = FALSE),
          col  = color.palette,
          main = paste(stringr::str_to_title(colnames(diamonds)[i]), "of Diamonds"),
          xlab = "Frequency",
          xlim = c(0, 25000),
          horiz = TRUE)
  
  pie(sort(table(diamonds[ , i]) , decreasing = TRUE),
      col        = color.palette,
      radius     = 1,
      clockwise  = TRUE,
      init.angle = 0,
      main       = paste(stringr::str_to_title(colnames(diamonds)[i]), "of Diamonds"))
  
}

# 그래프 화면 분할하기
# par(mfrow = c(nrow, ncol)) : 그래프가 1행부터 채워짐
# par(mfcol = c(nrow, ncol)) : 그래프가 1열부터 채워짐
par(mfrow = c(3, 2))
for(i in 2:4){
  barplot(sort(table(diamonds[ , i]) , decreasing = FALSE),
          col  = color.palette,
          main = paste(stringr::str_to_title(colnames(diamonds)[i]), "of Diamonds"),
          xlab = "Frequency",
          xlim = c(0, 25000),
          horiz = TRUE)
  
  pie(sort(table(diamonds[ , i]) , decreasing = TRUE),
      col        = color.palette,
      radius     = 1,
      clockwise  = TRUE,
      init.angle = 0,
      main       = paste(stringr::str_to_title(colnames(diamonds)[i]), "of Diamonds"))
  
}

# 그래프 화면을 원상태로 돌리기
# par(mfrow = c(1, 1))
par(mfrow = c(1, 1))


# pdf 파일로 그래프 저장하기
# pdf(file = "directory/filename.pdf") : 저장 시작
# 그래프 작업
# dev.off() : 저장 끝
# graphic device off
pdf(file = "graph.pdf")
for(i in 2:4){
  barplot(sort(table(diamonds[ , i]) , decreasing = FALSE),
          col  = color.palette,
          main = paste(stringr::str_to_title(colnames(diamonds)[i]), "of Diamonds"),
          xlab = "Frequency",
          xlim = c(0, 25000),
          horiz = TRUE)
  
  pie(sort(table(diamonds[ , i]) , decreasing = TRUE),
      col        = color.palette,
      radius     = 1,
      clockwise  = TRUE,
      init.angle = 0,
      main       = paste(stringr::str_to_title(colnames(diamonds)[i]), "of Diamonds"))
  
}
dev.off()


pdf(file = "graph2.pdf")
par(mfrow = c(3, 2))
for(i in 2:4){
  barplot(sort(table(diamonds[ , i]) , decreasing = FALSE),
          col  = color.palette,
          main = paste(stringr::str_to_title(colnames(diamonds)[i]), "of Diamonds"),
          xlab = "Frequency",
          xlim = c(0, 25000),
          horiz = TRUE)
  
  pie(sort(table(diamonds[ , i]) , decreasing = TRUE),
      col        = color.palette,
      radius     = 1,
      clockwise  = TRUE,
      init.angle = 0,
      main       = paste(stringr::str_to_title(colnames(diamonds)[i]), "of Diamonds"))
  
}
dev.off()
par(mfrow = c(1, 1))



# 2. 일변량 양적 자료의 분석 ----
# 2.1 표 = 빈도표(구간의 빈도, 백분율) ----
diamonds$price.group <- cut(diamonds$price,
                            breaks = seq(from = 0, to = 20000, by = 5000),
                            right  = FALSE) # 이상 ~ 미만
table(diamonds$price.group)
round(prop.table(table(diamonds$price.group))*100 , digits = 1)
levels(diamonds$price.group) <- c("5000미만",
                                  "5000이상~10000미만",
                                  "10000이상~15000미만",
                                  "15000이상")


# 2.2 그래프 : 히스토그램, 상자그림 ----
# (1) 히스토그램(Histogram)
# i. hist(data$variable)
hist(diamonds$price)

# ii. hist(data$variable, breaks = 구간정보)
hist(diamonds$price, 
     breaks = seq(from = 0, to = 20000, by = 2000))

# iii. hist(data$variable, breaks = 구간의 개수)
hist(diamonds$price, breaks = 10)


# (2) 상자그림(Boxplot)
# 이상치가 있는지를 파악하기 위하여 작성함
# i. boxplot(data$variable, range = 1.5)
boxplot(diamonds$price)

# ii. boxplot(data$variable ~ data$variable)
boxplot(diamonds$price ~ diamonds$cut)
boxplot(diamonds$price ~ diamonds$color)
boxplot(diamonds$price ~ diamonds$clarity)


# 2.3 기술통계량 = 요약통계량 ----
# (1) 중심 = 대표값
# 평균, 절사평균, 중위수, 최빈수
# i. 평균(Mean)
# mean(data$variable, na.rm = TRUE)
mean(diamonds$price)

# ii. 5% 절사평균(5% Trimmed Mean)
# mean(data$variable, trim = 0.05, na.rm = TRUE)
mean(diamonds$price, trim = 0.05)

# iii. 중위수 = 중앙값(Median)
# median(data$variable, na.rm = TRUE)
median(diamonds$price)

# iv. 최빈수 = 최빈값(Mode)
# which.max(table(data$variable))
age <- c(20, 38, 34, 30, 25, 39, 20, 20)
table(age)
which.max(c(10, 20, 100, 5))
which.min(c(10, 20, 100, 5))
which.max(table(age))

which.max(table(diamonds$price))

# prettyR::Mode(data$variable)
prettyR::Mode(diamonds$price)

# (2) 퍼짐 = 산포 = 다름 *****
# 범위, 사분위범위(사분위수범위), 분산, 표준편차, 중위수절대편차
# i. 범위(Range) : 최대값(Max) - 최소값(Min)
# diff(range(data$variable))
range(diamonds$price)
range(diamonds$price)[1] # 최소값
range(diamonds$price)[2] # 최대값

diff(c(326, 18823, 326))

diff(range(diamonds$price))

# ii. 사분위범위 = 사분위수범위(IQR : Inter Quartile Range)
# Q3(제3 사분위수) - Q1(제1 사분위수)
# IQR(data$variable)
IQR(diamonds$price)

# iii. 분산(Variance)
# 평균과 얼마나 다를까?를 알려주는 값
# var(data$variable)
var(diamonds$price)

# iv. 표준편차(SD : Standard Deviation)
# 평균과 얼마나 다를까를 알려주는 값
# sd(data$variable)
sd(diamonds$price)

# v. 중위수절대편차(MAD : Median Absolute Deviation)
# 중위수와 얼마나 다를까를 알려주는 값
# mad(data$variable)
mad(diamonds$price)


# (3) 분포의 모양
# i. 왜도(Skewness)
# 대칭 여부를 알려주는 값
# e1071::skewness(data$variable)
e1071::skewness(diamonds$price)

# ii. 첨도(Kurtosis)
# 중심이 얼마나 뾰족한가를 알려주는 값
# 중심에 얼마나 몰려있는가를 알려주는 값
# e1071::kurtosis(data$variable)
e1071::kurtosis(diamonds$price)

# (4) 기타
# 최소값, 최대값
# i. 최소값(Min)
# min(data$variable)
min(diamonds$price)

# ii. 최대값(Max)
# max(data$variable)
max(diamonds$price)


# (5) 기술통계량을 구하는 데에 유용한 함수들
# i. summary(data$variable)
summary(diamonds$price)

# ii. by() : 집단별로 어떤 작업할 때 사용
# by(양적 자료, 질적 자료, 함수명)
by(diamonds$price, diamonds$cut, mean)
by(diamonds$price, diamonds$cut, mean, trim = 0.05)
by(diamonds$price, diamonds$cut, sd)
by(diamonds$price, diamonds$cut, summary)
by(diamonds$price, diamonds$cut, hist)
par(mfrow = c(3, 2))
by(diamonds$price, diamonds$cut, hist)
par(mfrow = c(1, 1))

# iii. psych::describe(), psych::describeBy()
# psych::describe(data$variable)
psych::describe(diamonds$price)              # 10% 절사평균
psych::describe(diamonds$price, trim = 0.05) # 5% 절사평균
psych::describe(dplyr::select(diamonds, -(cut:clarity)))

# psych::describeBy(data$variable, data$variable)
# psych::describeBy(양적 자료, 질적 자료)
psych::describeBy(diamonds$price, group = diamonds$cut)
psych::describeBy(dplyr::select(diamonds, -(cut:clarity)), group = diamonds$cut)