anonomize_labels <- function(x) {
  if (is.numeric(x)) {
    return(x)
  }

  if (single_word(x)) {
    return(sample(animals, 1))
  }
  lorem(nchar(x))
}

anonomize_char <- function(x) {
  if (any(is.character(x))) {
    out <- as.factor(x)
    levels(out) <- sample(animals, length(levels(out)))
    return(out)
  }
  if (any(is.factor(x))) {
    out <- x
    levels(out) <- sample(animals, length(levels(out)))
    return(out)
  }
  x
}
