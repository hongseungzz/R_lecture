library(dplyr)
str(who_disease)
who_disease %>% 
  filter(region == "AMR",
         year == 1980,
         disease == "pertussis",
         cases > 0) -> data2

ggplot(data2, aes(x = cases)) +
  geom_histogram()


