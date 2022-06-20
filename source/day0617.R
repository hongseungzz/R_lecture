library(ggplot2)

# 통계
# 데이터
# 내장 데이터
# iris
help(str)    # 도움말
?str         # 도움말
str(iris)
# 시각화 레벨 1 문법
ggplot(data = iris, aes(x = Sepal.Length, y = Sepal.Width))  +
# x축, y축 설정 / + 필수 입력

geom_point()
