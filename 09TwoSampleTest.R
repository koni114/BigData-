#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : Two-sample Test                            #
#                                                      #
# Date    : August 30th, 2018                          #
# Author  : Huh Jae Hun                                #
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#

# Two-sample
# 모집단이 2개가 있는 것 
# 두 집단의 양적인 자료가 통계적인 의미의 차이가 있는지를 보는 것

# one-sample과 동일한데,

# 등분산과 이분산으로 크게 두가지로 나누어서 표본 표준편차를 추정할 수 있다
# 

# 등분산이 가정이 된 Two-Sample T-test
# sigma -> 간단한게 S1 + S2 / 2 로 바뀜

# 이분산이 가정이 될 때
# sigma^2 -> S1^2 , sigma1^2 -> S2^2 로..

#' 언제?
#' 두 개의 독립적인 모집단의 평균이 한 쪽이 큰 지, 작은지,
#' 같지 않은지를 통계적으로 분석하는 방법
#' 
#' 자료
#' 양적 자료 : 1개
#' 질적 자료 : 1개, 두 개의 값(집단)으로 이루어져야 함
#' 

data(sleep)

# 예제 데이터 : sleep
# 양적 자료   : extra
# 질적 자료   : group

# 귀무가설 : A 수면제의 수면시간 평균과 B 수면제의 수면시간 평균은 같다.
# 대립가설 : A 수면제의 수면시간 평균과 B 수면제의 수면시간 평균은 같지 않다

# 1단계 : 각 집단에 대한 정규성 검정
# 귀무가설 : 정규 분포를 따른다.
# 대립가설 : 정규 분포를 따르지 않는다
# by function을 이용하여 group 을 짓고, 원하는 함수를 입력

by(sleep$extra, sleep$group, shapiro.test)

# 결론 : 두 집단 모두 정규성 가정을 만족 함

# 2단계 : 정규성 가정이 만족되었기 때문에, 등분산성 검정 
# 귀무가설 : A 수면제의 수면시간과 B 수면제의 수면시간은 등분산이다
# 대립가설 : A 수면제의 수면시간과 B 수면제의 수면시간은 등분산이 아니다
# var.test( data$variable ~ data$variable )
# var.test( 양적 자료 ~ 질적 자료)

var.test(sleep$extra ~ sleep$group)

# 결론 : 유의확률이 0.743이므로 유의수준 0.05에서 등분산이다

# 2단계 : 정규성 가정이 만족되지 않았을 경우, 
# 월콕슨의 수위합 검정(wilcoxon's rank sum test)
# wilcox.test(data$variable ~ data$variable, alternative = )

# wilcox idea
# 1. group에 상관없이 오름차순으로 정렬
# 2. 작은 것 부터 순위를 매김
# 3. 그룹별로 순위를 더함
# 4. 더한 값을 근거로 유의 확률을 구함

wilcox.test(sleep$extra ~ sleep$group, alternative = "two.sided")



# 3단계 : 등분산이 가정이 되기 때문에
# 등분산이 가정 된 독립 2표본 t검정(Two-sample t-test)
# t.test(data$variable ~ data$variable, alternative = "two.sided", var.equal = T )

t.test(sleep$extra ~ sleep$group
       , alternative = "two.sided"
       , var.equal   = TRUE)


# 결론 : 유의확률이 0.079 이므로 유의수준 0.05에서 
# 두 수면제 간의 수면시간에는 통계저긍로 유의한 
# 차이는 없는 것으로 나타났다.


# 3단계 : 만약에 이분산이였다면, 
# 이분산이 가정 된 독립 2표본 t검정(Two-sample t-test) 실시
# t.test(data$variable ~ data$variable, alternative = "two.sided", var.equal = T )

t.test(sleep$extra ~ sleep$group
       , alternative = "two.sided"
       , var.equal   = FALSE) 

# 결론 : 유의확률이 0.079 이므로 유의수준 0.05에서 
# 두 수면제 간의 수면시간에는 통계저긍로 유의한 
# 차이는 없는 것으로 나타났다.







