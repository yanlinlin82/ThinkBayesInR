pmf <- function(hypos, likes) {
    m <- list(items = rep(1, length(hypos)), likes = likes)
    names(m$items) <- hypos
    class(m) <- "pmf"
    m <- normalize.pmf(m)
    m
}

normalize.pmf <- function(m) {
    m$items <- m$items / sum(m$items)
    m
}

update.pmf <- function(m, data) {
    for (x in data) {
        m$items <- m$items * sapply(m$likes[names(m$items)], "[", x)
    }
    m <- normalize.pmf(m)
    m
}

print.pmf <- function(m) {
    print(m$items)
}
