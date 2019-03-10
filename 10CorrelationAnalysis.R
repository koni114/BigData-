#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : correlation Analysis                       #
#                                                      #
# Date    : August 30th, 2018                          #
# Author  : Huh Jae Hun                                #
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#

install.packages("psych")
library(psych)

# 언제
# 두 개의 양적 자료 간의 관련성(직선의 관계 = 선형의 관계)이
# 있는지를 통계적으로 분석하는 방법

# 자료
# 양적 자료 : 2개
# 자료는 쌍(pair)으로 되어 있어야 함

# 예제 데이터 : cars, attitude, iris

# 1. 산점도(Scatter Plot), 산점행렬도(SPM : Scatter Plot Matrix)
# plot(data$variable, data$variable)

plot(cars$speed, cars$dist)

plot(attitude) # table 내에 질적 자료가 있으면 안됨
               # 일반적으로 가운데 변수를 기준으로 위에 있는 상관 변수를 upper triangle ,
               # 아래에 있는 것을 lower triangle 이라고 함

str(iris)
plot(iris[,1:4], pch = 20, col = "blue")

# 상관계수(coefficient of Correlation)
# 두 양적 자료 간의 관련성 정도가 얼마나 되는지를 수치로 알려주는 값 
# -1 ~ 1 사이의 값을 가짐
# 상관계수의 절대값이 1에 가까우면 관련성이 매우 높음
# 상관계수의 절대값이 0에 가까우면 관련성이 없음

# 공분산의 치명적인 약점
# 두 상관 관계 x, y에 대한 단위에 치명적인 영향을 받음
# 따라서 각각 x , y의 표준편차 값으로 나눠줌

# 로우 : 모집단의 상관계수, r : 표본의 상관계수

cor(cars$speed, cars$dist, method = "pearson") # 특별하지 않으면 소수점 3째자리 까지 계산
cor(attitude)
cor(iris[ , 1:4])

# 3. 상관 분석
# 귀무 가설 : speed와 dist 간에는 관련성이 없다. 로우 = 0
# 대립 가설 : speed와 dist 간에는 관련성이 있다. 로우 != 0   
# cor.test(data$variable, data$variable, method = "pearson")

cor.test(cars$speed, cars$dist, method = "pearson")

# 결론 : 유의확률이 0.000 이므로, speed 와 dist 간에는 통계적으로 유의한 관련성이 있음
# speed와 dist 간에는 통계적으로 유의한 양의 상관관계가 있는 것으로 나타남 

# 상관계수 해석의 일반적인 가이드

# |r| : 0.0 이상 ~ 0.2 미만 : 관련성이 없다
# |r| : 0.2 이상 ~ 0.4 미만 : 약한 관련성이 있다.
# |r| : 0.4 이상 ~ 0.6 미만 : 보통의 관련성이 있다.
# |r| : 0.6 이상 ~ 0.8 미만 : 높은 관련성이 있다.
# |r| : 0.8 이상 ~ 1.0 이하 : 매우 높은 관련성이 있다.

# psych:corr.test(data, mothod = "pearson")
# psych package 내 corr.test function 사용 가능. -> correlation matrix 제공

psych::corr.test(iris[, 1:4], method = "pearson")




