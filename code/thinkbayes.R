library("magrittr")

Set       <- function(x, ...) UseMethod("Set")
Incr      <- function(x, ...) UseMethod("Incr")
Mult      <- function(x, ...) UseMethod("Mult")
Normalize <- function(x, ...) UseMethod("Normalize")
Update    <- function(x, ...) UseMethod("Update")

Pmf <- function(hypos = NULL, likes = NULL) {
    m <- list(items = rep(1, length(hypos)), likes = likes)
    names(m$items) <- hypos
    class(m) <- "pmf"
    m <- Normalize(m)
    m
}

Set.pmf <- function(m, hypo, value = 0) {
    m$items[hypo] <- value
    return(m)
}

Incr.pmf <- function(m, hypo, term = 1) {
    m$items[hypo] <- m$items[hypo] + term
    return(m)
}

Mult.pmf <- function(m, hypo, factor) {
    m$items[hypo] <- m$items[hypo] * factor
    return(m)
}

Normalize.pmf <- function(m) {
    m$items <- m$items / sum(m$items)
    return(m)
}

Update.pmf <- function(m, ...) {
    dataset <- list(...)
    stopifnot(length(dataset) > 0)
    for (data in dataset) {
        for (hypo in names(m$items)) {
            if (is.function(m$likes)) {
                m$items[hypo] <- m$items[hypo] * m$likes(hypo = hypo, data = data)
            } else {
                m$items[hypo] <- m$items[hypo] * m$likes[[hypo]][[data]]
            }
        }
    }
    m <- Normalize(m)
    m
}

print.pmf <- function(m) {
    print(m$items)
}
