#' Select a subdata of map
#'
#' @param map an object of class Shape(SpatialPolygonsDataFrame)
#' @param area a string of area looking for
#'
#' @return Subdata of class Shape of which code matched with area
submap <-function(map,area){
    code=area2code(area)
    if(is.na(code)) return(NULL)
    else mydata=map[grep(paste0('^',code),map$code),]
}


#' Returns if x is integer(0)
#' @param x a vector
#'
#' @return a logical value: TRUE for integer(0) otherwise FALSE
is.integer0 <- function(x) {is.integer(x) && length(x) == 0L}


#' Seek area from data areacode and returns the code
#'
#' @param area a string looking for
#'
#' @return a code if the area is found, else returns NA
area2code<-function(area){
    result=NA
    pos=grep(area,areacode[[2]])
    if(!is.integer0(pos)) result=areacode[pos,1]
    else {
        pos=grep(areacode[[3]],area)
        if(!is.integer0(pos)) result=areacode[pos,1]
    }
    result
}

