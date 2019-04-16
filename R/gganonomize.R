#' Anonomize labels and text in a ggplot2 object
#'
#' @param x a ggplot object
#'
#' @return a ggplot object
#' @export
#'
#' @examples
#' library(ggplot2)
#' fff <- ggplot(mtcars, aes(mpg, disp, color = factor(vs), shape = factor(am))) +
#'   geom_point()
#'
#' fff
#'
#' gganonomize(fff)
gganonomize <- function(x) {
  name_table <- table(unlist(x$labels))
  repeat_name <- names(which(name_table > 1))
  ignore_labels <- x$labels %in% repeat_name
  if (any(name_table > 1)) {

    for (name in repeat_name) {
      x$labels[names(x$labels[x$labels == name])] <- sample(animals, 1)
    }
  }

  x$labels[!ignore_labels] <- lapply(x$labels[!ignore_labels], anonomize_labels)
  x$data <- data.frame(lapply(x$data, anonomize_char), stringsAsFactors = FALSE)

  x
}
