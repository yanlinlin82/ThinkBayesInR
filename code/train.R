# 火车头问题

# 问题描述见书3.2节：
#   铁路上以1到N命名火车头。有一天你看到一个标号60的火车头，请估计铁路上有多少火车头？

source("thinkbayes.R")

hypos <- 1:1000
likes <- function(hypo, data) {
    ifelse(as.numeric(hypo) < data, 0, 1 / as.numeric(hypo))
}

suite <- Pmf(hypos, likes)
suite <- suite %>% Update(60)
plot(suite$items, type = "l")

Mean <- function(m) {
    sum(as.numeric(names(m$items)) * m$items)
}

for (x in c(500, 1000, 2000)) {
    cat("***** For max =", x, ", data = 60:\n")
    Pmf(1:x, likes) %>% Update(60) %>% Mean %>% print
}

for (x in c(500, 1000, 2000)) {
    cat("*** For max =", x, ", data = [30, 60, 90]:\n")
    Pmf(1:x, likes) %>% Update(30, 60, 90) %>% Mean %>% print
}

for (x in c(500, 1000, 2000)) {
    cat("*** For max =", x, "(power law prior), data = [30, 60, 90]:\n")
    suite <- Pmf(NULL, likes)
    for (i in 1:x) {
        suite <- suite %>% Set(i, 1 / i)
    }
    suite %>% Update(30, 60, 90) %>% Mean %>% print
}
