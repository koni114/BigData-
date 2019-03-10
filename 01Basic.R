# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ # 
# Lecture : Basic                      #
# R의 Basic을 다뤄보자                 #
# Date    : August 27th, 2018
# Author  : jae hun Huh
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ #

# 08.27 Tip 정리
# console 에 +가 나오면, 전부다 실행되지 않았다는 의미
# ---- : 책갈피 기능! 오른쪽 상단과 script 하단에서 확인해서 넘어갈 수 있음
# Tools -> Global Options -> Appearance -> editor theme 로 화면 layout 화면 색상 변경 가능
# Tools -> Global Options -> Pane layout 을 통해 전체 화면의 layout 구조 변경 가능
# R 관련 Tool은 R-studio 말고 jupiter notebook도 존재.
# 한영 키가 안먹을 때 Web 화면 한번 클릭하고 다시 하면 됨
#' ctrl + Enter : 명령어 실행

x <- rnorm(n = 1000000);
x                           # 실행시 1000개만 보여주고 나머지는 생략
hist(x);                    # 난수를 histogram에서 확인
hist(x, col = "red");       # col = "색상명" 을 통해 색상 변경 가능
mean(x);                    # 0에 가까운 값이 나옴. 정규 분포 기준의 난수를 생성했기 때문, 


# 1. 연산자(Operator) ---- 
# 1.1. 산술 연산자 ----

# ex) +, -, *, /ㅡ, **, ^, %%, %/%
# 한줄에 명령어가 여러개 있는 경우는 세미 콜론이 들어가고, 나머지는 들어가지 않는다

3 + 4; 3 - 4 # error 발생, 명령어와 명령어 사이에 구분자가 없어서 발생
3 + 4;3 - 4 # 라인수를 줄이기 위해 사용했으나, 요즘은 그럴 필요가 없음

3 * 4     # 곱하기
3 / 4     # 나누기
3 ** 4    # 거듭제곱: ^와 ** 가 똑같은 기능. 일관성있게 해결하는 것이 중요
3 ^ 4     # 거듭제곱: 
13 %% 4   # 나머지를 의미 --> 1 
13 %/% 4  # 몫을 의미
3 ^ (1/2) # 루트를 의미. sqrt()을 사용해도 무방


# 1.2 할당 연산자 ----

# 1. <-,  2. =, 
# 일반적으로 같이 하는 것 보다, 아래와 같이 나눠서 사용하는 것을 권장

# 1. <- : 일반적인 할당 연산자로 사용
# 2. =  : 함수의 argument을 설정하는 할당 연산자

# 1.3. 비교 연산자 ----
# >, >=, <, <=, ==, !=, !

3 > 4 # FALSE를 명령어로 입력하려면, 다 대문자로 입력!
!(3==4)
x <- 100

# 1.4 논리 연산자 ----
# &(and) , |(pipe라고 읽음)
# & : and
# | : or
(3 > 4) & (5 > 4)
(3 > 4) | (5 > 4)

# 2. 데이터의 유형(Type of Data) ----
# 2.1 수치형(Numeric) ----

# 정수(integer), 실수(double)
x1 <- 10
x2 <- 10.2

# 2.2 문자형(Character) ----

x3 <- 'Love is choice.'
x4 <- "Love is not feeling." # 일반적으로 큰 따옴표를 많이 사용


# 2.3 논리형(logical) ----
x5 <- TRUE
x6 <- FALSE


# 3. 데이터의 유형 알아내기 ----
# 3.1 mode(data) ----
# mode의 최종적인 결과는 character
mode(x1) # numeric
mode(x3) # character
mode(x5) # logical

# 3.2 is.xxxx() ----
# is.xxxx 는 최종적인 결과를 logical로 출력
is.numeric(x1)    # TRUE
is.character(x2)  # x2는 문자형이 아니므로, FALSE
is.logical(x5)    # logical이 맞으므로, TRUE

# 4. 강제적으로 데이터의 유형을 변경하기 ----

as.numeric(x3)    # NA 출력 -> NA가 뜬다는 것은 변경이 안된다는 것.
as.numeric(x4)    # NA 출력 -> character가 숫자인 경우만 변함
as.numeric("100") # 정상적이게 변경
as.numeric(x5)    # logical 같은 경우, 수치형으로 변환시 1, 0으로 변환
as.numeric(x6)    # TRUE : 1 , FALSE : 2 

as.character(x1)  # 문자형 같은 경우, 대부분 변환이 가능!  
as.character(x2)
as.character(x5)
as.character(x6)

as.logical(x1) # 0을 제외한 나머지는 전부 TRUE, 0은 FALSE 
as.logical(x2)
as.logical(0)  # 숫자: 0만 FALSE, 나머지 숫자는 TRUE로 변경됨
as.logical(x3) # character는 logical로 변환 X
as.logical(x4)
as.logical("100")

# 5. 데이터 유형의 우선순위 ----
# charater > numeric > logical
# file 열기 -> ctrl + shift + N: script 열기





