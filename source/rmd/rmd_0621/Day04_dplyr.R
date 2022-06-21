# p.98
# 분석 프로세스

# 데이터 전처리를 위한 도구 dplyr
# 데이터 전처리를 위한 도구 data.table

## 처리속도 차이
# dplyr : 10GB 이내
# data.table: 50GB 이상

## 배움의 측면
# dplyr -> 매우 쉬움
# data.table -> 어려움

# 라이브러리 불러오기
install.packages("dplyr")
library("dplyr")

mpg1 <- read.csv("mpg1.csv", stringsAsFactors = F)
str(mpg1)

data_1 <- mpg1 %>%   # ctrl+shift+M
  select(drv, cty, hwy) %>%
  filter(drv == "f")

# select : 컬럼명 추출
# filter : 행 추출(조건식)
# mutate : 
# group by : 
# summarize() :

data_2 <- select(mpg1, drv, cty, hwy)
data_2 <- filter(data_2, drv == "f")
data_2 

# 교재 p.99 ~ p.120
# 파생변수

# 데이터 미리보기
glimpse(iris)
iris
iris %>%
  # species, setosa, versicolor
  filter(Species != "virginica") %>% 
  select(Sepal.Length, Sepal.Width) %>%
  filter(Sepal.Length > 5.0) %>%
  mutate(total = Sepal.Length + Sepal.Width) -> data2


# p.121 집단별 통계량
mpg1 %>% 
  group_by(trans) %>% 
  summarize(avg     = mean(cty)
            , total = sum(cty)
            , med   = median(cty)
            , count = n())

install.packages("nycflights13")
install.packages("tidyverse")
library("nycflights13")
library("tidyverse")
library("dplyr")

n()
mpg1 %>% group_by(trans)
