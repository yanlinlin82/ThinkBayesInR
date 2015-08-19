# Monty Hall难题

# 问题描述见书1.7，猜三个门后面的奖品
#
# 挑选A门，主持人打开没有奖品的B门，问是否选择换到剩下未开的C门上

source("thinkbayes.R")

hypos <- c("A", "B", "C")
likes <- function(data, hypo) {
    if (hypo == data) {
        return(0)
    } else if (hypo == "A") {
        return(.5)
    } else {
        return(1)
    }
}

monty <- Pmf(hypos, likes)
monty <- monty %>% Update("B")
print(monty)
