# get_cars_plumber.R

library(plumber)
library(dplyr)

# Basic car data
df <- mtcars %>% select(cyl, mpg)
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

