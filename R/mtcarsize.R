#' Anonomize labels and text in a ggplot2 object to make it look like mtcars
#'
#' @param x a ggplot object
#'
#' @return a ggplot object
#' @export
#'
#' @importFrom rlang "%||%"
#' @examples
#' library(ggplot2)
#' fff <- ggplot(mtcars, aes(mpg, disp, color = factor(vs), shape = factor(am))) +
#'   geom_point()
#'
#' fff
#'
#' mtcarsize(fff)
mtcarsize <- function(x) {
  name_table <- table(unlist(x$labels))
  repeat_name <- names(which(name_table > 1))
  ignore_labels <- x$labels %in% repeat_name
  if (any(name_table > 1)) {

    for (name in repeat_name) {
      x$labels[names(x$labels[x$labels == name])] <- sample(names(datasets::mtcars), 1)
    }
  }

  x$labels[!ignore_labels] <- lapply(x$labels[!ignore_labels], mtcars_labels)
  x$data <- data.frame(lapply(x$data, mtcars_char), stringsAsFactors = FALSE)

  x
}

mtcars_labels <- function(x) {
  if (is.numeric(x)) {
    return(x)
  }

  if (single_word(x)) {
    return(sample(names(datasets::mtcars), 1))
  }
  lorem(nchar(x), unlist(strsplit(rownames(datasets::mtcars), " ")))
}

mtcars_char <- function(x) {
  if (any(is.character(x))) {
    out <- as.factor(x)
    levels(out) <- sample(rownames(datasets::mtcars), length(levels(out)))
    return(out)
  }
  if (any(is.factor(x))) {
    out <- x
    levels(out) <- sample(rownames(datasets::mtcars), length(levels(out)))
    return(out)
  }
  x
}

