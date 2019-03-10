#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : One-sample Test                            #
#                                                      #
# Date    : August 30th, 2018                          #
# Author  : Huh Jae Hun                                #
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#

#' 언제
#' 하나의 모집단의 평균이 커졌는지, 작아졌는지, 달라졌는지를
#' 통계적으로 분석하는 방법
#' 
#' ex) 불량률을 줄이기 위해 행동을 취했는데, 평균이나 표준편차가 달라졌는지 TEST
#' 

# 귀무 가설 : 성인들의 용돈의 평균은 50만원이다
# 대립 가설 : 성인들의 용돈의 평균은 50만원보다 많다.

# data 불러오기
survey <- readxl::read_excel(path  = "survey.xlsx",
                             sheet = 1,
                             col_names = TRUE)

# 1단계. 정규성 검정(Normality Test)
# 귀무 가설 : 성인들의 용돈은 정규분포를 따른다.
# 대립 가설 : 성인들의 용돈은 정규분포를 따르지 않는다.
# shapiro.test(data$variable)

shapiro.test(survey$money)

# 결론 : 유의확률이  0.6117 이므로, 정규성을 만족

# 2단계. 일표본 t검정(one-sample T-Test)
# t.test(data$variable, mu = , alternative = )
# mu           : 귀무가설이 참일 때의 평균
# alternative  : 대립가설, "greater", "less", "two.sided"

t.test(survey$money, mu = 50, alternative = "greater")

# 유의 확률이 0.054이므로 유의수준 0.05에서
# 성인들의 용돈의 평균은 통계적으로 변화되지 않았다
# 즉, 귀무가설이다

# 2단계 : 정규성 가정이 깨졌을 때,
# 윌콕슨의 부호 순위 검정(wilcoxon's signed rank test)

# wilcox test idea
# 1. 전체 데이터에서 평균을 뺀다
# 2. 절대 값을 취한다
# 3. 정렬한다
# 4. 순위를 매긴다
# 5. WT를 계산. WT(부호가 +인 것들의 순위를 계산) ==> 39
# 6. wilcox.test 에서의 V가 ==> 39 (통계량이라고 생각하면 됨)

wilcox.test(survey$money, mu = 50, alternative = "greater")

# 결론,
# 유의확률이 0.06 이므로, 유의수준 0.05 에서
# 성인들의 용돈의 평균은 통계적으로 유의하게 높아졌다.
# 즉, 대립가설이다

# 모수적 방법(Parametric Method)
# 모집단의 분포를 가정할 수 있을 때에 사용하는 분석 방법
# One sample Test

# 비모수적 방법(Non-parametric Method)
# 모집단의 분포를 가정할 수 없을 때에 사용하는 분석 방법
# wilcoxon Test

