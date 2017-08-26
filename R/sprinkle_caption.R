#' @name sprinkle_caption
#' @title Change the Caption in a Dust Table
#' 
#' @description The table caption is often used as a brief title, but may also 
#'   be used to provide a longer statement explaining how to interpret the 
#'   table results.
#'   
#' @param x An object of class \code{dust}
#' @param caption \code{character(1)} giving the new caption for the table.
#' @param ... Additional arguments to pass to other methods. Currently ignored.
#'
#' @details The caption may be set during the initial \code{dust} call.  This
#'   method allows for modification afterward, such as in the case of when a 
#'   \code{dust} object is loaded from memory and the initial call cannot be
#'   accessed.
#'   
#' @author Benjamin Nutter
#' 
#' @seealso \code{\link{dust}}, \code{\link{sprinkle}}
#' 
#' @section Functional Requirements:
#' \enumerate{
#'  \item Change the \code{caption} attribute of the \code{dust} object.
#'  \item Cast an error if \code{x} is not a \code{dust} object.
#'  \item Cast an error if \code{caption} is not a character object.
#'  \item Cast an error if \code{caption} has length greater than 1.
#' }
#' 
#' @export

sprinkle_caption <- function(x, caption, ...)
{
  UseMethod("sprinkle_caption")
}

#' @rdname sprinkle_caption
#' @export

sprinkle_caption.default <- function(x, caption, ...)
{
  coll <- checkmate::makeAssertCollection()
  
  checkmate::assert_class(x = x,
                          classes = "dust",
                          add = coll)
  
  checkmate::assert_character(x = caption,
                              len = 1,
                              add = coll)
  
  checkmate::reportAssertions(coll)
  
  x[["caption"]] <- caption
  
  x
}

#' @rdname sprinkle_caption
#' @export

sprinkle_caption.dust_list <- function(x, caption, ...)
{
  structure(
    lapply(x,
           sprinkle_caption.default,
           caption),
    "dust_list"
  )
}

# Unexported utilities ----------------------------------------------
# These functions carry the the `_index` suffix for consistency with 
# the cell-valued sprinkles, but they don't actually require an 
# index, since they change table-valued sprinkles

sprinkle_caption_index_assert <- function(caption, coll)
{
  checkmate::assert_character(x = caption,
                              len = 1,
                              add = coll,
                              .var.name = "caption")
}

sprinkle_caption_index <- function(x, caption)
{
  x[["caption"]] <- caption
  
  x
}