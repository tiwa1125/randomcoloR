# Execute upon loading.
.onLoad <- function(libname, pkgname){
  ct <<- v8()
  ct$source(system.file("js/randomColor.js", package=pkgname))

  # Compute a 2000 color spectrum and convert to LAB
  n <- 2e3
  ourColorSpace <<- colorspace::RGB(runif(n), runif(n), runif(n))
  ourColorSpace <<- as(ourColorSpace, "LAB")

  # Alternate color palette (fixed!)
  alternateColorSpace <<- t(unique(col2rgb(hue_pal(l = 70)(n))))
}
