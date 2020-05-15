.onAttach <- function(libname,pkgname)
{
  packageStartupMessage("Additional documentation is being constructed at ",
                        "https://suchanutter.net/pixiedust/index.html")
}

.onLoad <- function(libname,pkgname)
{
  options(pixie_count = 0L)
}

.onUnload <- function(libPath)
{
  options(pixie_count = NULL)
}
