# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ # 
# Lecture : Basic                      #
# R�� Basic�� �ٷﺸ��                 #
# Date    : August 27th, 2018
# Author  : jae hun Huh
# @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ #

# 08.27 Tip ����
# console �� +�� ������, ���δ� ������� �ʾҴٴ� �ǹ�
# ---- : å���� ���! ������ ��ܰ� script �ϴܿ��� Ȯ���ؼ� �Ѿ �� ����
# Tools -> Global Options -> Appearance -> editor theme �� ȭ�� layout ȭ�� ���� ���� ����
# Tools -> Global Options -> Pane layout �� ���� ��ü ȭ���� layout ���� ���� ����
# R ���� Tool�� R-studio ���� jupiter notebook�� ����.
# �ѿ� Ű�� �ȸ��� �� Web ȭ�� �ѹ� Ŭ���ϰ� �ٽ� �ϸ� ��
#' ctrl + Enter : ���ɾ� ����

x <- rnorm(n = 1000000);
x                           # ����� 1000���� �����ְ� �������� ����
hist(x);                    # ������ histogram���� Ȯ��
hist(x, col = "red");       # col = "�����" �� ���� ���� ���� ����
mean(x);                    # 0�� ����� ���� ����. ���� ���� ������ ������ �����߱� ����, 


# 1. ������(Operator) ---- 
# 1.1. ��� ������ ----

# ex) +, -, *, /��, **, ^, %%, %/%
# ���ٿ� ���ɾ ������ �ִ� ���� ���� �ݷ��� ����, �������� ���� �ʴ´�

3 + 4; 3 - 4 # error �߻�, ���ɾ�� ���ɾ� ���̿� �����ڰ� ��� �߻�
3 + 4;3 - 4 # ���μ��� ���̱� ���� ���������, ������ �׷� �ʿ䰡 ����

3 * 4     # ���ϱ�
3 / 4     # ������
3 ** 4    # �ŵ�����: ^�� ** �� �Ȱ��� ���. �ϰ����ְ� �ذ��ϴ� ���� �߿�
3 ^ 4     # �ŵ�����: 
13 %% 4   # �������� �ǹ� --> 1 
13 %/% 4  # ���� �ǹ�
3 ^ (1/2) # ��Ʈ�� �ǹ�. sqrt()�� ����ص� ����


# 1.2 �Ҵ� ������ ----

# 1. <-,  2. =, 
# �Ϲ������� ���� �ϴ� �� ����, �Ʒ��� ���� ������ ����ϴ� ���� ����

# 1. <- : �Ϲ����� �Ҵ� �����ڷ� ���
# 2. =  : �Լ��� argument�� �����ϴ� �Ҵ� ������

# 1.3. �� ������ ----
# >, >=, <, <=, ==, !=, !

3 > 4 # FALSE�� ���ɾ�� �Է��Ϸ���, �� �빮�ڷ� �Է�!
!(3==4)
x <- 100

# 1.4 ���� ������ ----
# &(and) , |(pipe��� ����)
# & : and
# | : or
(3 > 4) & (5 > 4)
(3 > 4) | (5 > 4)

# 2. �������� ����(Type of Data) ----
# 2.1 ��ġ��(Numeric) ----

# ����(integer), �Ǽ�(double)
x1 <- 10
x2 <- 10.2

# 2.2 ������(Character) ----

x3 <- 'Love is choice.'
x4 <- "Love is not feeling." # �Ϲ������� ū ����ǥ�� ���� ���


# 2.3 ������(logical) ----
x5 <- TRUE
x6 <- FALSE


# 3. �������� ���� �˾Ƴ��� ----
# 3.1 mode(data) ----
# mode�� �������� ����� character
mode(x1) # numeric
mode(x3) # character
mode(x5) # logical

# 3.2 is.xxxx() ----
# is.xxxx �� �������� ����� logical�� ���
is.numeric(x1)    # TRUE
is.character(x2)  # x2�� �������� �ƴϹǷ�, FALSE
is.logical(x5)    # logical�� �����Ƿ�, TRUE

# 4. ���������� �������� ������ �����ϱ� ----

as.numeric(x3)    # NA ��� -> NA�� ��ٴ� ���� ������ �ȵȴٴ� ��.
as.numeric(x4)    # NA ��� -> character�� ������ ��츸 ����
as.numeric("100") # �������̰� ����
as.numeric(x5)    # logical ���� ���, ��ġ������ ��ȯ�� 1, 0���� ��ȯ
as.numeric(x6)    # TRUE : 1 , FALSE : 2 

as.character(x1)  # ������ ���� ���, ��κ� ��ȯ�� ����!  
as.character(x2)
as.character(x5)
as.character(x6)

as.logical(x1) # 0�� ������ �������� ���� TRUE, 0�� FALSE 
as.logical(x2)
as.logical(0)  # ����: 0�� FALSE, ������ ���ڴ� TRUE�� �����
as.logical(x3) # character�� logical�� ��ȯ X
as.logical(x4)
as.logical("100")

# 5. ������ ������ �켱���� ----
# charater > numeric > logical
# file ���� -> ctrl + shift + N: script ����




