---
title: "test_1"
output:
  html_document:
    keep_md: true
date: '2022-06-20'
---




```r
mpg1 <- read.csv("mpg1.csv")
str(mpg1)
```

```
## 'data.frame':	234 obs. of  5 variables:
##  $ manufacturer: chr  "audi" "audi" "audi" "audi" ...
##  $ trans       : chr  "auto" "manual" "manual" "auto" ...
##  $ drv         : chr  "f" "f" "f" "f" ...
##  $ cty         : int  18 21 20 21 16 18 18 18 16 20 ...
##  $ hwy         : int  29 29 31 30 26 26 27 26 25 28 ...
```


```r
library(ggplot2)

ggplot(mpg1, aes(x = hwy, y = cty)) +
  geom_point()
```

![](test_1_files/figure-html/unnamed-chunk-2-1.png)<!-- -->

