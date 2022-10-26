library(plumber)

# Basic car data
df <- mtcars[c('cyl', 'mpg')]
df$model <- row.names(df)
row.names(df) <- NULL

#* Return cars
#* @param cyl
#* @serializer json list(na="string")
#* @get /cars
function(cyl="all") {
  if (cyl == "all") {
    return(df)
  } else {
    return(df[df$cyl == as.integer(cyl),])
  }
}

