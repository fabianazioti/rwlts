#' @title Build wlts tibble
#'
#' @param result a named \code{list} from request in get_trajectory.
#' @param index  a \code{numeric} point identifier.
#'
#' @return a \code{tibble} with trajectory data.
.build_wlts_tb <- function(result, index) {

  # transform to tibble the result requested
  wlts_tb <- do.call(rbind, sapply(result$trajectory,
                                   tibble::as_tibble,
                                   simplify = FALSE))

  # add an index to each extracted point
  if (!length(wlts_tb) == 0)
    wlts_tb <- tibble::add_column(wlts_tb, point_id = index)

  return(wlts_tb)
}
