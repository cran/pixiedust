## ---- echo=FALSE---------------------------------------------------------
Sprinkles <- read.csv(system.file("sprinkles.csv", package = "pixiedust"),
                        stringsAsFactors=FALSE)
Sprinkles[,-1] <- lapply(Sprinkles[-1], trimws)

## ---- echo=FALSE---------------------------------------------------------
library(pixiedust)
red <- "#A50026"
lightgreen <- "#A6DBA0"
green <- "#006837"
yellow <- "#FFFFBF"

x <- dust(Sprinkles[, -2]) %>% 
  sprinkle(row = which(Sprinkles$implemented == ""), 
           col = "sprinkle", bg = yellow) %>% 
  sprinkle(row = which(Sprinkles$implemented == "x"),
           col = "sprinkle", bg = lightgreen)
x$body$bg <- ifelse(x$body$bg != "",
                    x$body$bg,
                    ifelse(x$body$value == "",
                           "black",
                           ifelse(x$body$value == "o",
                                  red,
                                  green)))
x$body$value <- ifelse(x$body$value %in% c("x", "o"), "", x$body$value)
  
x %>% sprinkle_print_method(print_method = "html")


