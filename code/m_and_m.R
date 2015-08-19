# M&M豆问题

# 问题描述见书1.6节

# 两袋M&M豆，一袋是1994年，一袋是1996年。从每个袋子各取一个M&M豆，一个是黄色，一个是绿色。
# 问黄色豆来自1994年袋子的概率。

source("thinkbayes.R")

mix94 <- c("brown" = 30,
           "yellow" = 20,
           "red" = 20,
           "green" = 10,
           "orange" = 10,
           "tan" = 10)
mix96 <- c("blue" = 24,
           "green" = 20,
           "orange" = 16,
           "yellow" = 14,
           "red" = 13,
           "brown" = 13)

hypos <- list("A" = list("bag1" = mix94, "bag2" = mix96),
              "B" = list("bag1" = mix96, "bag2" = mix94))
likes <- function(hypo, data) {
    bag <- data[[1]]
    color <- data[[2]]
    hypos[[hypo]][[bag]][[color]]
}

Pmf(c("A", "B"), likes) %>%
    Update(c("bag1", "yellow")) %>%
    Update(c("bag2", "green")) %>%
    print
