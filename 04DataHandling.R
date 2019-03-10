# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ # 
# Lecture : Data Handling = Data Preprocessing            #
#                                                         #
# Date    : August 27th, 2018                             #
# Author  : jae hun Huh                                   #
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ #

# Data Handling -> 70 ~ 80% ���� �ð� �ҿ�
# ���� Data�� �ٷ��� ��

# ggplot2 package ��� : Data Visualization �� ���������, ���� Data�� ����ϱ� ���Ͽ� ���

# ��Ű�� ��ġ�ϱ�� �ε��ϱ�
install.packages("ggplot2") # grammer grahic �� ���Ӹ� : gg
install.packages("DT")
install.packages("dplyr")

# ** package ��ġ�� ������ ����
# The following object is masked from ��package:ggplot2��: vars �� �ǹ̴�,
# ggplot2�� �ִ� vars �Լ� ���� ��ģ�� ��� �ǹ�!



library(ggplot2)
library(DT)
library(dplyr)


# �۾� ����: �ٸ� script�� �Ȱܰ� ���� ����Ͽ� �׻� �۾� ���� setting �۾��� �����ϴ� ���� �߿�
setwd("d:POSCOICT/")

# ������ �ҷ�����
# ���� ���� Data�� �ִٸ�, read.csv ���� �̿��Ͽ� �ҷ��� ����
# ����� ���� Data�� ���� ������ ���� ������ ���

# 1. ������ ��ü ���� ----
# 1.1 data        : console�� ��µ� ----

diamonds # tibble �� dataFrame 

# 1.2 View(data)  : Editor windows�� ��µ� ----
View(diamonds)

# 2. �������� �Ϻ� ���� ----
# 2.1 head(data, n = 6) ----
head(diamonds, n = 6) # default : 6
head(diamonds, n = 20)

# 2.2 tail(data, n = 6)
tail(diamonds, n = 20)

# head, tail�� ���� data�� �� ���� �Դ��� check

# 2.3 DT::datatable(data)

DT::datatable(head(diamonds, n = 20))

# ** 2.1, 2.2�� �ֿܼ� ��µ�. but datatable�� web style �� ��� ��
# ** ������ �м��� �� �˾ƾ� �� package �� 50�� ������ ��
# ** �ܺε����͸� �������� �⺻������ dataFrame ���·� setting

# 3. �������� ����(structure) ���� ----
# str(data)

str(diamonds) # tbl : table�� ����

# 4. �������� �����跮 ----
# �������� ������ �ִ��� check üũ��

# summary(data)
# ������ Data�� ���� �ڵ� ǥ�� ����. -> �̰��� ���� ������ �ʿ伺�� ����
# 

summary(diamonds)

# 5. �������� �Ӽ� ----
# 5.1 ���� ���� : nrow(data) ----

nrow(diamonds)

# 5.2 �� = ������ ���� : ncol(data) ----

ncol(diamonds)

# 5.3 ���� �̸� : rownames(data) ----
# data�� �ܺο��� �������� �Ϸ� ��ȣ�� ���ڷ� �ٲپ setting ��

rownames(diamonds)

# 5.4 ���� �̸� : ������ �̸� ----

colnames(diamonds)[]

# 5.5 ����(dimension) : dim(data) ----
# ���� ������ ���� ����

dim(diamonds)
dim(diamonds)[1] # ���� ����
dim(diamonds)[2] # ���� ����

# 5.6 ������ �̸� : dimnames(data) ----

dimnames(diamonds)      # --> list ������ ���Ա� ����
dimnames(diamonds)[1]   # --> list, ���� �̸�
dimnames(diamonds)[[1]] # --> Vector, ���� �̸� 

# 6. �������� slicing ----
# data[rowIndex, colIndex]

# 6.1 ��
# (1) ���� ��ġ�� �� ��
# data[ , colIndex]
diamonds[ , 1] # carat:
diamonds[ , 2] # cut: diamond�� ǰ��

# ����
# 1, 9, 10 ��° ���� �� ���� ����������.
diamonds[, c(1, 9, 10)]


# 6.2 3 ~ 8��° ���� �� ���� ����������.
diamonds[ , 3:8]

# ����
# Ȧ�� ��° ���� �� ���� ����������
diamonds[, seq(from =  1, to = ncol(diamonds), by = 2)]

# (2) ���� �̸��� �� ��
diamonds[ , "carat"]
diamonds[ , "cut"]

# x, y, z��� �������� ������ �����͸� ����������
diamonds[ , c("x", "y", "z")]

# (3) �� = ���� �̸��� ������ ���� ��
# ** grep("pattern", characterVector, value = FALSE) # : ��ġ index return
# ** grep("pattern", characterVector, value = TRUE)  # : ������ return

# i. �������� c��� ���ڸ� �����ϰ� �ִ� ��� �÷� ��� ----

grep("c", colnames(diamonds), value = FALSE) 
grep("c", colnames(diamonds), value = TRUE)

diamonds[ , grep("c", colnames(diamonds), value = FALSE)]
diamonds[ , grep("c", colnames(diamonds), value = TRUE)]

# ii. �������� c�� �����ϴ� ��� ----

grep("^c", colnames(diamonds), value = TRUE)
diamonds[ , grep("^c", colnames(diamonds), value = TRUE)]

# iii. �������� Ư���� ���ڷ� ������ ��� ----
# �������� e�� ������ ���
# grep("e$", colnames(diamonds), value = TRUE)

# (4) dplyr::select(data, variable)

dplyr::select(diamonds, carat)
dplyr::select(diamonds, carat, cut) # 2�� �÷� select
dplyr::select(diamonds, x:z)        # x ���� z������ �÷� ��ġ ������ ����
dplyr::select(diamonds, -(x:z))     # x,y,z ���� ������ �� select































