#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#
# Lecture : Basis Data Analysis                        #
#                                                      #
# Date    : August 28th, 2018                          #
# Author  : Buil Lee                                   #
#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#

# ��Ű�� ��ġ�ϱ�� �ε��ϱ�
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


# �۾�����
setwd("c:/POSCOICT/")


# ������ �ҷ�����


# �����͸� : diamonds
# ������   : "carat", "cut", "color",  "clarity", "depth", "table",
#            "price", "x", "y", "z"

# �ڷ��� ����
# 1. ���� �ڷ� : cut, color, clarity
# 2. ���� �ڷ� : carat, depth, table, price, x, y, z

# Ž���� �ڷ� �м�(EDA : Exploratory Data Analysis)

# 1. �Ϻ���(Uni-variate = �ϳ��� ���� = �ϳ��� ��) ���� �ڷ��� �м�----
# 1.1 ǥ = ��ǥ(��, �����)
# (1) ��(Frequency)
# table(data$variable)
table(diamonds$cut)
sort(table(diamonds$cut) , decreasing = TRUE)


# (2) �����(Percent)
# prop.table(frequency) : ���� = 0 ~ 1
# prop.table(frequency)*100 : ����� = 0 ~ 100
prop.table(table(diamonds$cut))*100
sort(prop.table(table(diamonds$cut))*100 , decreasing = TRUE)
round(sort(prop.table(table(diamonds$cut))*100 , decreasing = TRUE) , digits = 1)


for(i in 2:4){
  print(sort(table(diamonds[ , i]) , decreasing = TRUE))
  print(round(sort(prop.table(table(diamonds[ , i]))*100 , decreasing = TRUE) , digits = 1))
}


# 1.2 �׷��� : ����׷���, ���׷���
# (1) ����׷���
# barplot(frequency or percent) : ���� ����׷���
barplot(sort(table(diamonds$cut) , decreasing = TRUE))

# ���� ���� : col = "color"
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

# ���� : main = "title"
barplot(sort(table(diamonds$cut) , decreasing = TRUE),
        col  = color.palette,
        main = "Cut of Diamonds")

# y�� ���� : ylab = "y's axis title"
# ylab     : y label�� ����
barplot(sort(table(diamonds$cut) , decreasing = TRUE),
        col  = color.palette,
        main = "Cut of Diamonds",
        ylab = "Frequency")

# y�� ���� : ylim = c(min, max)
# ylim     : y limit�� ����
barplot(sort(table(diamonds$cut) , decreasing = TRUE),
        col  = color.palette,
        main = "Cut of Diamonds",
        ylab = "Frequency",
        ylim = c(0, 25000))

# ���� ����׷��� : horiz = TRUE
# horiz           : horizontal�� ����
barplot(sort(table(diamonds$cut) , decreasing = FALSE),
        col  = color.palette,
        main = "Cut of Diamonds",
        xlab = "Frequency",
        xlim = c(0, 25000),
        horiz = TRUE)

# ����
# cut, color, clarity�� ���� ����׷����� �ۼ��Ͻÿ�.
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


# (2) ���׷���
# pie(frequency or percent)
pie(sort(table(diamonds$cut) , decreasing = TRUE))
pie(sort(table(diamonds$cut) , decreasing = TRUE),
    col = color.palette)

# ������ : radius = 0.8
pie(sort(table(diamonds$cut) , decreasing = TRUE),
    col    = color.palette,
    radius = 1)

# �ð���� : clockwise = TRUE
pie(sort(table(diamonds$cut) , decreasing = TRUE),
    col       = color.palette,
    radius    = 1,
    clockwise = TRUE)

# ù° ������ ���� ���� : init.angle = 
# (1) �ݽð���� : 0
# (2) �ð����   : 90
pie(sort(table(diamonds$cut) , decreasing = TRUE),
    col        = color.palette,
    radius     = 1,
    clockwise  = TRUE,
    init.angle = 0)

# ����
# cut, color, clarity�� ���� ����׷����� ���׷����� 
# �ۼ��Ͻÿ�.
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

# �׷��� ȭ�� �����ϱ�
# par(mfrow = c(nrow, ncol)) : �׷����� 1����� ä����
# par(mfcol = c(nrow, ncol)) : �׷����� 1������ ä����
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

# �׷��� ȭ���� �����·� ������
# par(mfrow = c(1, 1))
par(mfrow = c(1, 1))


# pdf ���Ϸ� �׷��� �����ϱ�
# pdf(file = "directory/filename.pdf") : ���� ����
# �׷��� �۾�
# dev.off() : ���� ��
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



# 2. �Ϻ��� ���� �ڷ��� �м� ----
# 2.1 ǥ = ��ǥ(������ ��, �����) ----
diamonds$price.group <- cut(diamonds$price,
                            breaks = seq(from = 0, to = 20000, by = 5000),
                            right  = FALSE) # �̻� ~ �̸�
table(diamonds$price.group)
round(prop.table(table(diamonds$price.group))*100 , digits = 1)
levels(diamonds$price.group) <- c("5000�̸�",
                                  "5000�̻�~10000�̸�",
                                  "10000�̻�~15000�̸�",
                                  "15000�̻�")


# 2.2 �׷��� : ������׷�, ���ڱ׸� ----
# (1) ������׷�(Histogram)
# i. hist(data$variable)
hist(diamonds$price)

# ii. hist(data$variable, breaks = ��������)
hist(diamonds$price, 
     breaks = seq(from = 0, to = 20000, by = 2000))

# iii. hist(data$variable, breaks = ������ ����)
hist(diamonds$price, breaks = 10)


# (2) ���ڱ׸�(Boxplot)
# �̻�ġ�� �ִ����� �ľ��ϱ� ���Ͽ� �ۼ���
# i. boxplot(data$variable, range = 1.5)
boxplot(diamonds$price)

# ii. boxplot(data$variable ~ data$variable)
boxplot(diamonds$price ~ diamonds$cut)
boxplot(diamonds$price ~ diamonds$color)
boxplot(diamonds$price ~ diamonds$clarity)


# 2.3 �����跮 = �����跮 ----
# (1) �߽� = ��ǥ��
# ���, �������, ������, �ֺ��
# i. ���(Mean)
# mean(data$variable, na.rm = TRUE)
mean(diamonds$price)

# ii. 5% �������(5% Trimmed Mean)
# mean(data$variable, trim = 0.05, na.rm = TRUE)
mean(diamonds$price, trim = 0.05)

# iii. ������ = �߾Ӱ�(Median)
# median(data$variable, na.rm = TRUE)
median(diamonds$price)

# iv. �ֺ�� = �ֺ�(Mode)
# which.max(table(data$variable))
age <- c(20, 38, 34, 30, 25, 39, 20, 20)
table(age)
which.max(c(10, 20, 100, 5))
which.min(c(10, 20, 100, 5))
which.max(table(age))

which.max(table(diamonds$price))

# prettyR::Mode(data$variable)
prettyR::Mode(diamonds$price)

# (2) ���� = ���� = �ٸ� *****
# ����, ���������(�����������), �л�, ǥ������, ��������������
# i. ����(Range) : �ִ밪(Max) - �ּҰ�(Min)
# diff(range(data$variable))
range(diamonds$price)
range(diamonds$price)[1] # �ּҰ�
range(diamonds$price)[2] # �ִ밪

diff(c(326, 18823, 326))

diff(range(diamonds$price))

# ii. ��������� = �����������(IQR : Inter Quartile Range)
# Q3(��3 �������) - Q1(��1 �������)
# IQR(data$variable)
IQR(diamonds$price)

# iii. �л�(Variance)
# ��հ� �󸶳� �ٸ���?�� �˷��ִ� ��
# var(data$variable)
var(diamonds$price)

# iv. ǥ������(SD : Standard Deviation)
# ��հ� �󸶳� �ٸ�� �˷��ִ� ��
# sd(data$variable)
sd(diamonds$price)

# v. ��������������(MAD : Median Absolute Deviation)
# �������� �󸶳� �ٸ�� �˷��ִ� ��
# mad(data$variable)
mad(diamonds$price)


# (3) ������ ���
# i. �ֵ�(Skewness)
# ��Ī ���θ� �˷��ִ� ��
# e1071::skewness(data$variable)
e1071::skewness(diamonds$price)

# ii. ÷��(Kurtosis)
# �߽��� �󸶳� �����Ѱ��� �˷��ִ� ��
# �߽ɿ� �󸶳� �����ִ°��� �˷��ִ� ��
# e1071::kurtosis(data$variable)
e1071::kurtosis(diamonds$price)

# (4) ��Ÿ
# �ּҰ�, �ִ밪
# i. �ּҰ�(Min)
# min(data$variable)
min(diamonds$price)

# ii. �ִ밪(Max)
# max(data$variable)
max(diamonds$price)


# (5) �����跮�� ���ϴ� ���� ������ �Լ���
# i. summary(data$variable)
summary(diamonds$price)

# ii. by() : ���ܺ��� � �۾��� �� ���
# by(���� �ڷ�, ���� �ڷ�, �Լ���)
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
psych::describe(diamonds$price)              # 10% �������
psych::describe(diamonds$price, trim = 0.05) # 5% �������
psych::describe(dplyr::select(diamonds, -(cut:clarity)))

# psych::describeBy(data$variable, data$variable)
# psych::describeBy(���� �ڷ�, ���� �ڷ�)
psych::describeBy(diamonds$price, group = diamonds$cut)
psych::describeBy(dplyr::select(diamonds, -(cut:clarity)), group = diamonds$cut)