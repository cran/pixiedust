#' @name pixiedust_print_method
#' @title Determine the Current Print Method
#' 
#' @description The user has the option of designating the print method to use, or 
#'   allowing package to select one from the \code{knitr} settings.  This 
#'   function manages the logic of assigning the correct print method within the
#'   \code{dust} call.
#'   
#' @details The function \code{pixiedust_print_method} first uses 
#'   \code{getOption("pixiedust_print_method")} to determine if the user has set 
#'   a print method.  If the user has not, it then looks to 
#'   \code{knitr::opts_knit$get("rmarkdown.pandoc.to")}. Finally, if this is also
#'   \code{NULL}, then the option is set to \code{"console"}.

pixiedust_print_method <- function()
{
  print_method <- 
    getOption("pixiedust_print_method",
              knitr::opts_knit$get("rmarkdown.pandoc.to"))
  
  if (is.null(print_method))
  {
    print_method <- "console"
  }
  
  switch(print_method,
         "beamer" = "latex",
         print_method)
}
