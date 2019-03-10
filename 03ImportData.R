# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ # 
# Lecture : Import Data                #
#                                      #
# Date    : August 27th, 2018
# Author  : jae hun Huh
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ #

# ������ �ҷ����� 3���� ����

# 1. txt
# 2. csv 
# 3. excel(xlsx, xls)
# 4. db

# 1. txt ----
# 1.1 (1) ������(Separator) : blank ----

# data <- read.table(file = "directory/filename.txt", 
#                                  header = TRUE, 
#                                  sep = " ")

# header = TRUE : �÷����� �ְڴٴ� �ǹ�
# header = FALSE : v1 v2 v3 �� �÷����� �ְڴٴ� �ǹ�

blank <- read.table(file   = "d:/POSCOICT/blank.txt", 
                    header = TRUE, 
                    sep    = " ")

View(blank)


# 1.2 (1) ������(Separator) : comma ----

# data <- read.table(file = "directory/comma.txt", 
#                                  header = TRUE, 
#                                  sep = ",")

comma <- read.table(file   = "d:/POSCOICT/comma.txt",  # ���� c�� ���۵Ǵ� ������ �ϳ��ۿ� ������ �ٷ� �ڵ� �ϼ� ��
                    header = TRUE, 
                    sep    = ",")

View(comma)

# 1.3 (1) ������(Separator) : tab ----

# data <- read.table(file = "directory/filename.txt", 
#                                  header = TRUE, 
#                                  sep = "\t")

tab <- read.table(file   = "d:/POSCOICT/tab.txt",  # ���� c�� ���۵Ǵ� ������ �ϳ��ۿ� ������ �ٷ� �ڵ� �ϼ� ��
                    header = TRUE, 
                    sep    = "\t")
View(tab)

# DB ����ڰ� tab, comma, �������� ������ �޶�� �ϸ� �ٵ�!

# 2. csv(comma separated value) ----
# data <- read.csv(file = "directory/filename.csv"
#                 ,header = TRUE)

hope <- read.csv(file  = "d:/POSCOICT/hope.csv", 
                header = TRUE)

View(hope)

# 3. excel ----
# R�� �⺻��ɿ����� �� �о��
# �߰����(��Ű��)�� ��ġ�ϸ� ��
# package name : readxl
# package?
# (1) function *****
# (2) data    : ��Ű�� ���� data ����
# (3) help    :
# (4) example : 

# -> python������ ���̺귯����� ��Ī ��

# 4. ��Ű�� ��ġ�ϱ� ----
# ��Ű�� ��ġ�� ���� ��ǻ�Ϳ��� �� �� ���� ��
# ��Ű���� update �ǰų� ������ �������� ��츦 �����ϰ��� �� ���� ��ġ ��
# install.packages("packageName") 
install.packages("readxl") # ���ͳ� ������ �Ǿ� �־�� ��

# 5. ��Ű�� �ε��ϱ� ----
library(packageName)
library(readxl)

# data <- readxl::read_excel(path = "directory/filename.xlsx", 
#                           sheet = "sheetName" or index, )
#                           col_names = TRUE # col_names �� �״�� ������ ���ڴٴ� �ǹ�

# ���������� �տ� package ���� �����ִ� ���� ����!
reading <- readxl::read_excel(path      = "d:/POSCOICT/reading.xlsx",
                              sheet     = "data",
                              col_names = TRUE)

# NA : NOT Available
# = Missing Value 
# = ������, ����ġ

# NULL : object�� ���� ����

reading2 <- readxl::read_excel(path      = "d:/POSCOICT/reading.xlsx",
                               sheet     =  1, # index ���� ����
                               col_names = TRUE)

# 6. �۾�����(working Directory) ----
# ����ȭ�� -> ������ ��ġ�� default

# (1) ���� ������ �۾����� �˾Ƴ��� ----
# getwd()
getwd()

# (2) ���ο� �۾����� �����ϱ� ----
# setwd("directory")
setwd("d:/POSCOICT/") # POSCOICT �� �۾� ���� ����

# �۾� ������ ���� ���� �� �ָ� path Ȯ�� ����

reading3 <- readxl::read_excel(path      = "reading.xlsx",
                               sheet     =  1, # index ���� ����
                               col_names = TRUE)

View(reading3)

# install.packages�� �ѹ� �� �ϸ� ��
# library �� RSudio�� ������ �� ���� �ٽ� ���� �����־����
