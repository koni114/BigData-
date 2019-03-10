#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : correlation Analysis                       #
#                                                      #
# Date    : August 30th, 2018                          #
# Author  : Huh Jae Hun                                #
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#

install.packages("psych")
library(psych)

# ����
# �� ���� ���� �ڷ� ���� ���ü�(������ ���� = ������ ����)��
# �ִ����� ��������� �м��ϴ� ���

# �ڷ�
# ���� �ڷ� : 2��
# �ڷ�� ��(pair)���� �Ǿ� �־�� ��

# ���� ������ : cars, attitude, iris

# 1. ������(Scatter Plot), ������ĵ�(SPM : Scatter Plot Matrix)
# plot(data$variable, data$variable)

plot(cars$speed, cars$dist)

plot(attitude) # table ���� ���� �ڷᰡ ������ �ȵ�
               # �Ϲ������� ��� ������ �������� ���� �ִ� ��� ������ upper triangle ,
               # �Ʒ��� �ִ� ���� lower triangle �̶�� ��

str(iris)
plot(iris[,1:4], pch = 20, col = "blue")

# ������(coefficient of Correlation)
# �� ���� �ڷ� ���� ���ü� ������ �󸶳� �Ǵ����� ��ġ�� �˷��ִ� �� 
# -1 ~ 1 ������ ���� ����
# �������� ���밪�� 1�� ������ ���ü��� �ſ� ����
# �������� ���밪�� 0�� ������ ���ü��� ����

# ���л��� ġ������ ����
# �� ��� ���� x, y�� ���� ������ ġ������ ������ ����
# ���� ���� x , y�� ǥ������ ������ ������

# �ο� : �������� ������, r : ǥ���� ������

cor(cars$speed, cars$dist, method = "pearson") # Ư������ ������ �Ҽ��� 3°�ڸ� ���� ���
cor(attitude)
cor(iris[ , 1:4])

# 3. ��� �м�
# �͹� ���� : speed�� dist ������ ���ü��� ����. �ο� = 0
# �븳 ���� : speed�� dist ������ ���ü��� �ִ�. �ο� != 0   
# cor.test(data$variable, data$variable, method = "pearson")

cor.test(cars$speed, cars$dist, method = "pearson")

# ��� : ����Ȯ���� 0.000 �̹Ƿ�, speed �� dist ������ ��������� ������ ���ü��� ����
# speed�� dist ������ ��������� ������ ���� ������谡 �ִ� ������ ��Ÿ�� 

# ������ �ؼ��� �Ϲ����� ���̵�

# |r| : 0.0 �̻� ~ 0.2 �̸� : ���ü��� ����
# |r| : 0.2 �̻� ~ 0.4 �̸� : ���� ���ü��� �ִ�.
# |r| : 0.4 �̻� ~ 0.6 �̸� : ������ ���ü��� �ִ�.
# |r| : 0.6 �̻� ~ 0.8 �̸� : ���� ���ü��� �ִ�.
# |r| : 0.8 �̻� ~ 1.0 ���� : �ſ� ���� ���ü��� �ִ�.

# psych:corr.test(data, mothod = "pearson")
# psych package �� corr.test function ��� ����. -> correlation matrix ����

psych::corr.test(iris[, 1:4], method = "pearson")



