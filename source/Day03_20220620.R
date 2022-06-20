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
english <- c(88,95,92,84,86)
math <- c(82,93,90,80,88)

exam = data.frame(no, sex, korean, english, math)

exam

exam$no[3]
exam$sex[4]

# 데이터 타입
class(exam$sex)
str(exam)  # 벡터를 효율적으로 정렬
