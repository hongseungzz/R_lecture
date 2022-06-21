# 벡터
num_vector = c(1,3,4,5,6)
num_vector[3]
num_vector[5]
num_vector[2] * num_vector[3]
num_vector[7]

# 명목형 자료형 Factor
locaiton_vector <- c("서울", "인천", "부산")
factor_location_vector <- factor(locaiton_vector)
factor_location_vector

class(factor_location_vector)
help(factor)

# 순서형 자료형 Factor
temperature_factor <- c("기온높음", 
                        "기온보통", 
                        "기온낮음", 
                        "기온높음", 
                        "기온보통", 
                        "기온보통")

temperature_factor

factor_temperature_factor <- factor(temperature_factor, 
                                    ordered = TRUE, 
                                    levels  = c("기온보통", 
                                                "기온낮음", 
                                                "기온높음"))
factor_temperature_factor
class(factor_temperature_factor)
levels(factor_temperature_factor)

## 데이터 프레임
# - 엑셀 데이터
no <- c(1,2,3,4,5)
sex <- c("male","female","male","male","female")
korean <- c(87,92,95,81,87)


exam = data.frame(no, sex, korean)

exam

exam$no[3]
exam$sex[4]

# 데이터 타입
class(exam$sex)
str(exam)  # 벡터 구조를 효율적으로 파악 가능


# 데이터 내보내기 & 불러오기
# 경로
getwd()

temp = read.csv("dataset/exam.csv")
write.csv(exam, file="exam01.csv")
exam = read.csv("exam.csv")
exam = read.csv("data/exam.csv")

?read.csv





library("ggplot2")

economics <- ggplot2::economics

str(economics)
# 여기서 잠깐(p.66)
# 실무 패키지

install.packages("data.table")
library("data.table")

fread("student.csv")

#공식문서 확인

#엑셀파일 불러오기
install.packages("readxl")
library("readxl")

excel = read_excel("student1_xl.xlsx")
read_excel("student1_xl.xlsx")
read.csv("student1.csv",skip = 1)

# 엑셀 파일에 있는 복수의 시트에서 특정 시트 불러오기

read_excel("student1_xl.xlsx",sheet=2)
getwd()
read_excel("student1_xl.xlsx",sheet=1)


# p.69 txt 파일 불러오기

read.table("student1.txt")
read.table("student3.txt", sep = ",")

# p.73 spss 파일 불러오기
install.packages("foreign")
library("foreign")
student <- read.spss("student.sav")
as.data.frame(student)    # 형태 변환

read.table("student1.txt", header = T)
read.csv("student2.csv", header = F)
student2 <- read.csv("student2.csv", header = F)
student2
colnames(student2) <- c("no","sex","height","weight")
student2

library("ggplot2")
library("data.table")
library("foreign")
library("readxl")
