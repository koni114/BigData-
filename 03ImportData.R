# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ # 
# Lecture : Import Data                #
#                                      #
# Date    : August 27th, 2018
# Author  : jae hun Huh
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ #

# 데이터 불러오기 3가지 형태

# 1. txt
# 2. csv 
# 3. excel(xlsx, xls)
# 4. db

# 1. txt ----
# 1.1 (1) 구분자(Separator) : blank ----

# data <- read.table(file = "directory/filename.txt", 
#                                  header = TRUE, 
#                                  sep = " ")

# header = TRUE : 컬럼명을 주겠다는 의미
# header = FALSE : v1 v2 v3 로 컬럼명을 주겠다는 의미

blank <- read.table(file   = "d:/POSCOICT/blank.txt", 
                    header = TRUE, 
                    sep    = " ")

View(blank)


# 1.2 (1) 구분자(Separator) : comma ----

# data <- read.table(file = "directory/comma.txt", 
#                                  header = TRUE, 
#                                  sep = ",")

comma <- read.table(file   = "d:/POSCOICT/comma.txt",  # 만약 c로 시작되는 파일이 하나밖에 없으면 바로 자동 완성 됨
                    header = TRUE, 
                    sep    = ",")

View(comma)

# 1.3 (1) 구분자(Separator) : tab ----

# data <- read.table(file = "directory/filename.txt", 
#                                  header = TRUE, 
#                                  sep = "\t")

tab <- read.table(file   = "d:/POSCOICT/tab.txt",  # 만약 c로 시작되는 파일이 하나밖에 없으면 바로 자동 완성 됨
                    header = TRUE, 
                    sep    = "\t")
View(tab)

# DB 담당자가 tab, comma, 공백으로 구분해 달라고 하면 줄듯!

# 2. csv(comma separated value) ----
# data <- read.csv(file = "directory/filename.csv"
#                 ,header = TRUE)

hope <- read.csv(file  = "d:/POSCOICT/hope.csv", 
                header = TRUE)

View(hope)

# 3. excel ----
# R의 기본기능에서는 못 읽어옴
# 추가기능(패키지)을 설치하면 됨
# package name : readxl
# package?
# (1) function *****
# (2) data    : 패키지 예시 data 제공
# (3) help    :
# (4) example : 

# -> python에서는 라이브러리라고 지칭 함

# 4. 패키지 설치하기 ----
# 패키지 설치는 동일 컴퓨터에서 딱 한 번만 함
# 패키지가 update 되거나 강제로 제거했을 경우를 제외하고는 한 번만 설치 함
# install.packages("packageName") 
install.packages("readxl") # 인터넷 연결이 되어 있어야 함

# 5. 패키지 로딩하기 ----
library(packageName)
library(readxl)

# data <- readxl::read_excel(path = "directory/filename.xlsx", 
#                           sheet = "sheetName" or index, )
#                           col_names = TRUE # col_names 를 그대로 가지고 오겠다는 의미

# 습관적으로 앞에 package 명을 적어주는 것이 좋다!
reading <- readxl::read_excel(path      = "d:/POSCOICT/reading.xlsx",
                              sheet     = "data",
                              col_names = TRUE)

# NA : NOT Available
# = Missing Value 
# = 결측값, 결측치

# NULL : object가 없는 상태

reading2 <- readxl::read_excel(path      = "d:/POSCOICT/reading.xlsx",
                               sheet     =  1, # index 지정 가능
                               col_names = TRUE)

# 6. 작업공간(working Directory) ----
# 바탕화면 -> 내문서 위치가 default

# (1) 현재 설정된 작업공간 알아내기 ----
# getwd()
getwd()

# (2) 새로운 작업공간 설정하기 ----
# setwd("directory")
setwd("d:/POSCOICT/") # POSCOICT 로 작업 공간 설정

# 작업 공간을 새로 설정 해 주면 path 확인 가능

reading3 <- readxl::read_excel(path      = "reading.xlsx",
                               sheet     =  1, # index 지정 가능
                               col_names = TRUE)

View(reading3)

# install.packages는 한번 만 하면 됨
# library 는 RSudio를 종료할 때 마다 다시 실행 시켜주어야함

