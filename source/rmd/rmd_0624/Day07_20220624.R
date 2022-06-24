# 사례분석 - 한국인의 정신건강 분석

library(dplyr)
library(ggplot2)  
library(foreign)

mental_health <- read.spss("한국행정연구원_사회통합실태조사_데이터_2019.sav")

class(mental_health)

mental_health <- as.data.frame(mental_health)

class(mental_health)

str(mental_health)

mental_health <- mental_health %>% 
  select(q32_2, q1_4, q32_1, q34_1, q52, d17, d1, d2, ara) %>% 
  rename(suicide       = q32_2,
         satisfaction  = q1_4,
         loneliness    = q32_1,
         family_belief = q34_1,
         wealth        = q52,
         health        = d17,
         sex           = d1,
         age           = d2,
         area          = ara)

str(mental_health)

table(mental_health$suicide)

table(mental_health$satisfaction)

# 범주이름 변환
##변수 간 관계를 분석하기 위해 문자에서 숫자로 이름 변환
mental_health$suicide <- as.integer(mental_health$suicide)
mental_health$satisfaction<- as.integer(mental_health$satisfaction)
mental_health$loneliness <- as.integer(mental_health$loneliness)
mental_health$family_belief <- as.integer(mental_health$family_belief)
mental_health$wealth <- as.integer(mental_health$wealth)
mental_health$health <- as.integer(mental_health$health)

table(mental_health$suicide)

table(mental_health$wealth)

table(mental_health$satisfaction)

# satisfaction,wealth 변수는 조사 시에 0~10점으로 조사되었으나 빈도를  확인해보면 1~11로 구성되어 있음
# 정수형 변수로 변환되면서 첫 번째 문항을 1로 시작했기 때문
# 이대로 분석하면 응답내용이 실제보다 1점씩 부풀려지는 오류 발생
# 변수의 범주 숫자에서 1점씩을 빼는 보정작업 진행

mental_health$satisfaction <- mental_health$satisfaction-1
mental_health$wealth <- mental_health$wealth-1

table(mental_health$wealth)
table(mental_health$satisfaction)

# 범주이름 변환
## 범주형으로 분석하면 오류가 발생할 수 있어 범주형에서 문자형으로 변환

mental_health$age <- as.character(mental_health$age)
mental_health$sex <- as.character(mental_health$sex)
mental_health$area <- as.character(mental_health$area)

table(mental_health$age)
table(mental_health$sex)
table(mental_health$area)

mental_health$age <- ifelse(mental_health$age == "19~29세", "20대",
      ifelse(mental_health$age == "60~69세", "60대", mental_health$age))

# 결측치 확인
summary(mental_health)

table(mental_health$satisfaction)


# 빈도분석
mental_health %>% 
  group_by(sex) %>% 
  summarise(n=n()) %>%   # sex 변수의 범주별 빈도 구하기
  mutate(total = sum(n),   # sex 변수의 빈도총계 구하기
         pct = round(n/total*100,1))   # sex 변수의 범주별비율 구하기

# 교차 분석
## 성과 연령대의 교차 빈도 구하기
table(mental_health$sex, mental_health$age)

## 교차 백분율 구하기
round(prop.table(table(mental_health$sex, mental_health$age),1),1)

round(prop.table(table(mental_health$sex, mental_health$age),1)*100, 1)

## 교차분석 검정
chisq.test(mental_health$sex, mental_health$age)


# 평균분석
mental_health %>% 
  summarise(m1=mean(suicide), 
            m2=mean(satisfaction),
            m3=mean(loneliness),
            m4=mean(family_belief),
            m5=mean(wealth),
            m6=mean(health))



# 삶의 만족도와 외로움이 자살충동에 미치는 영향
RA <- lm(suicide~satisfaction+loneliness, data=mental_health)
summary(RA)

# 삶의 만족도와 외로움의 상관관계
cor.test(mental_health$satisfaction, mental_health$loneliness)
cor.test(mental_health$satisfaction, mental_health$wealth, mental_health$health)

# 가족신뢰도, 경제안정도, 건강상태가 삶의 만족도와 외로움에 미치는 영향
RA <- lm(satisfaction~family_belief+wealth+health, data=mental_health)
summary(RA)

RA <- lm(loneliness~family_belief+wealth+health, data=mental_health)
summary(RA)

# 성, 연령, 지역별 삶의 만족도 차이
## 성별 삶의 만족도 차이 -> 독립표본 t 검정
t.test(satisfaction~sex, data=mental_health)
var.test(satisfaction~sex, data=mental_health)

## 연령대별 삶의 만족도 차이 -> 그룹이 5개 -> 평균만 알아보고 비교
mental_health %>% 
  group_by(age) %>% 
  summarise(m=mean(satisfaction)) %>% 
  arrange(desc(m))   # 평균값을 내림차순으로 정렬

## 지역별 삶의 만족도 분석과 그래프 그리기
area_mean <- mental_health %>% 
                group_by(area) %>% 
                summarize(m=mean(satisfaction)) %>% 
                arrange(desc(m))

ggplot(area_mean, aes(x=reorder(area,m), y=m)) +
  geom_col(colour = "#080317",
           alpha = 0.5,
           size = 0.01,
           fill = "#79F04F") +
  coord_flip() +
  labs(
    x = "지역",
    y = "만족도 평균",
    title = "지역별 만족도"
  )
