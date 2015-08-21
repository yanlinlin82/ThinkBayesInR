# 骰子问题

# 问题描述见书3.1节：一盒骰子，有4面、6面、8面、12面、20面的骰子各一个。
# 转到6,问每个骰子被选中的概率。

source("thinkbayes.R")

dice <- c(4, 6, 8, 12, 20)
likes <- function(hypo, data) {
    if (as.numeric(hypo) < data) {
        return(0)
    } else {
        return(1 / as.numeric(hypo))
    }
}

suite <- Pmf(dice, likes)

cat("After one 6\n")
suite <- suite %>% Update(6)
print(suite)

cat("After more rolls\n")
suite <- suite %>% Update(4, 8, 7, 7, 2)
print(suite)

cat("Example in book\n")
Pmf(dice, likes) %>% Update(6, 8, 7, 7, 5, 4) %>% print
