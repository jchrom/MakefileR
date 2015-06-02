#' Creates a group of Makefile items
#'
#' Helps separating similar rules and definition.
#'
#' @param ... Rules created by \code{\link{make_rule}}
#' @param .dots A list rules in addition to \code{...}
#' @param comment A comment for the group
#' @param sep Separator between group items, \code{NULL} (the default) means
#'   no separator.
#'
#' @examples
#' makefile(make_rule("all", c("first_target", "second_target")))
#'
#' @references \url{https://www.gnu.org/software/make/manual/}
#'
#' @importFrom magrittr %>% equals is_greater_than
#' @export
make_group <- function(..., .dots = NULL, comment = NULL, sep = NULL) {
  rules <- c(list(...), .dots)
  stopifnot(
    vapply(rules, inherits, logical(1), "MakefileR")
  )
  structure(list(rules = rules, comment = NULL),
            class = c("MakefileR_group", "MakefileR"))
}

#' @export
format.MakefileR_group <- function(x, ...) {
  lapply(x, format) %>%
    Reduce(
      f = function(x, y) c(x, y),
      init = c("# Generated by MakefileR, do not edit by hand"))
}

#' @export
print.MakefileR_group <- print.MakefileR_file

#' @export
c.MakefileR_group <- function(..., recursive = FALSE) {
  make_group(.dots = c(unclass(makefile), rules))
}