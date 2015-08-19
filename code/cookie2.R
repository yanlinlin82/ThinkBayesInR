# 曲奇饼问题

source("thinkbayes.R")

hypos <- c("Bowl 1", "Bowl 2")
mixes <- list("Bowl 1" = c("vanilla" = .75, "chocolate" = .25),
              "Bowl 2" = c("vanilla" = .5, "chocolate" = .5))

Pmf(hypos, mixes) %>%
    Update("vanilla") %>%
    print

cat("------\n")

Pmf(hypos, mixes) %>%
    Update("vanilla", "chocolate", "vanilla") %>%
    print
