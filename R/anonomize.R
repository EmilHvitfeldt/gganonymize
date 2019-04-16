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
    places <- as.numeric(as.factor(x))
    return(sample(animals, max(places))[places])
  }
  if (any(is.factor(x))) {
    places <- as.numeric(x)
    return(sample(animals, max(places))[places])
  }
  x
}
