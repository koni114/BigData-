#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : regression Analysis                        #
#                                                      #
# Date    : August 30th, 2018                          #
# Author  : Huh Jae Hun                                #
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#

install.packages("car")
install.packages("lm.beta")

library(car)
library(lm.beta)
# 언제
# 어떤 양적 자료(들) 또는 질적 자료(들)가 
# 다른 양적 자료에게 영향을 주는지를
# 통계적으로 분석하는 방법
# 인과 관계를 알아내기 위한 방법

# 예측(prediction), 분류(classification)
# 회귀 분석은 예측이 주로 사용됨

# 독립 변수 = 설명 변수 = input = feature 
# 종속 변수 = 반응 변수 = output = label

# 선형과 비선형으로 나눌 수 있음

# 선형 회귀분석
# 비선형 회귀분석

# 선형 회귀분석
# 1. 단순선형 회귀분석

# 독립변수 : 1개, 양적 자료
# 종속변수 : 1개, 양적 자료

# 회귀분석결과 <- lm(종속변수 ~ 독립변수, data = dataName)
# summary(회귀분석결과)
cars.model <- lm(dist ~ speed, data = cars)

summary(cars.model)
# 1단계 : 회귀 모형은 타당한가? 
# 귀무가설 : 회귀 모형은 타당하지 않다
# 대립가설 : 회귀 모형은 타당하다

# F-statistic: 89.57 on 1 and 48 DF,  p-value: 1.49e-12
# 결론 : p-value가 거의 0에 가까우므로, 유의 수준 0.05에서 회귀 모형은 통계적으로 유의하게 타당

# 2단계 : 1단계의 결론이 대립 가설이기 때문에,
# 독립변수는 종속변수에게 영향을 주는가? 
# 귀무가설 : 독립변수는 종속변수에게 영향을 주지 않는다.
# 대립가설 : 독립변수는 종속변수에게 영향을 준다

# Coefficients:
#                Estimate Std. Error t value Pr(>|t|)    
#   speed         3.9324     0.4155   9.464 1.49e-12 ***

# 유의 확률이 0.000이므로 유의수준 0.05에서 대립 가설 채택
# 독립변수(Speed)는 종속변수(dist)에게 통계적으로 유의한 영향을 준다

# 3단계 : 2단계의 결론이 대립가설이기 때문에, 
# 독립변수는 종속변수에게 어떠한 영향을 주는가?

# Coefficients:
#                Estimate Std. Error t value Pr(>|t|)    
#   speed         3.9324     0.4155   9.464 1.49e-12 ***

# 회귀계수(beta1)   : coefficient of Regression
# 회귀계수의 추정치 : 3.932 --> 영향력.
# 독립 변수의 기본 단위가 1 증가하면,  종속 변수를 3.932 증가 시킨다
# -> speed가 1 mph 증가하면 dist를 약 3.932 feet 정도 증가시키는 영향을 줌

# 4단계 : 회귀 모형의 설명력( = 독립변수의 설명력)
# 회귀 모형이 종속변수의 다름을 어느 정도 설명하고 있는가?
# Multiple R-squared:  0.651,
# 결정계수(coefficient of Determination)

# R^2 = SSR / SST = (0 ~ 1 사이의 값)
# 독립 변수가 종속 변수의 다름을 약 65.1% 정도 설명하고 있다.
#  speed가 dist의 다름을 약 65.1% 정도 설명하고 있다

# 5단계 : 예측(prediction)
# predict(regressionModel, newdata = data.frame(독립변수 = ))

predict(cars.model, newdata = data.frame(speed = 200))
predict(cars.model, newdata = data.frame(speed = c(200, 300, 400)))

# 2. 다중선형 회귀분석
# 독립 변수 : 개수가 2개 이상, 양적 자료
# 종속 변수 : 1개, 양적 자료

# 회귀 분석 결과 <- lm(종속변수 ~ 독립변수1 + 독립변수2 + ... + 독립변수k)

attitude.model <- lm(rating ~., data = attitude)
summary(attitude.model)

# 해석
# 1단계  회귀모형은 타당한가?
# 귀무가설 : 회귀모형은 타당하지 않다
# 대립가설 : 회귀모형은 티당하다

#  10.5 on 6 and 23 DF,  p-value: 1.24e-05
# 결론 : 회귀모형은 통계적으로 유의하게 타당하다.

# 2단계 독립변수(들)가 종속변수에게 영향을 주는가? 
# 귀무가설 : 독립변수는 종속변수에게 영향을 주지 않는다 
# 대립가설 : 독립변수는 종속변수에게 영향을 미친다

# Coefficients:
#               Estimate Std. Error t value Pr(>|t|)    
# complaints     0.61319    0.16098   3.809 0.000903 ***
# privileges    -0.07305    0.13572  -0.538 0.595594    
# learning       0.32033    0.16852   1.901 0.069925 .  
# raises         0.08173    0.22148   0.369 0.715480    
# critical       0.03838    0.14700   0.261 0.796334    
# advance       -0.21706    0.17821  -1.218 0.235577    

# 결론 : complaints만 종속변수에게 통계적으로 유의한 영향을 주고, 나머지 5개의 독립변수는 종속변수에 통계적으로
# 유의한 영향을 주지 않는다

# 만약 complaints 가 빠지더라도 나머지 변수들은 유의한 영향을 미칠 확률은 낮다.
# 이때는 유의한 변수만 선택을 해서 회귀 모형을 만들지, 다 넣을지 고려를 해야 함

# 변수 선택
# 최종모형에 어떤 독립변수들을 포함시킬 것인가?를 결정함

# (1) 전진 선택방법(Forward selection Method)
# (2) 후진 선택방법(backward Elimination Method)
# (3) 단계 선택방법(Stepwise Method)

# step(회귀모형, direction = )
# direction : "forward", "backward", "both"

attitude.model.forward <- step(attitude.model, direction = "forward")
attitude.model.backward <- step(attitude.model, direction = "backward")
attitude.model.stepwise <- step(attitude.model, direction = "both")

summary(attitude.model.stepwise)

# AIC : 좋은 모형을 찾기위한 또 하나의 기준
# AIC는 가장 작은게 좋음 --> stepwise 결과가 가장 좋다는 것을 알 수 있음

# 3단계 : 독립변수가 종속변수에게 어떠한 영향을 주는가?

#                Estimate Std. Error t value Pr(>|t|)    
# complaints      0.6435     0.1185   5.432 9.57e-06 ***
#   learning      0.2112     0.1344   1.571    0.128 

# Coefficients는 다른 독립 변수가 고정되어 있을 때(움직이지 않을 때)
# complaints의 기본단위가 1증가하면 종속변수를 약 0.644 정도 증가시키는 영향을 주고, 
# 
# learning는 다른 독립변수가 고정되어 있을 때, 
# learning의 기본단위가 1증가하면 종속변수를 약 0.211 정도 증가시킴


# 4단계 : 회귀 모형의 설명력
# Multiple R-squared:  0.708,	Adjusted R-squared:  0.6864

# ** 여기서는 Adjusted R-squared 쓰는 것이 더 좋다! 
# R-squared 는 종속변수에 유의하지 않은 독립변수가 들어오더라도 이 값이 커지는 성질이 있음
# Adjusted R-squared 종속변수에 유의한 독립변수가 들어올 때만 R-Squared 를 증가시키도록 조정함.

# --> 독립변수들이 종속변수를 약 68.6% 정도 설명하고 있다

# 5단계 : 예측

predict(attitude.model.stepwise, 
        newdata = data.frame(complaints = 10, learning = 5))

# 단순 선형 회귀에서는 변수 선택법을 적용 할 수 없다

# ** 고려 사항
# 1. 다중 공선성(Multicollinearity) : 독립 변수들간의 상관 관계를 보는 것

# - 가정 : 다중공선성은 없어야 함
# VIF(Variance Inflation Factor) : 분산팽창요인 = 분산팽창인자

# VIF 값이 10 이상이면, 다중 공선성이 있다고 판단함.
# car::vif(회귀모형)

car::vif(attitude.model.stepwise)


# 2. 독립변수들의 영향력 비교
# 독립변수들 중에서 종속변수에게 가장 큰 영향을 주는 변수는 ?

# 표준화된 회귀 계수
# 표준화된 회귀계수의 절대값이 가장 큰 독립변수가 가장 큰 영향을 줌

# lm.beta::lm.beta(회귀모형)

lm.beta::lm.beta(attitude.model.stepwise)

# 잔차에 대한 가정 검정이 필요
# ex) 등분산성, 독립성, 선형성 등 ... 검정이 필요!











