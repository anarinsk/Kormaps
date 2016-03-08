#' Select subdata of map
#'
#' @param map an object of class Shape(SpatialPolygonsDataFrame)
#' @param area a string of area looking for
#'
#' @return Subdata of class Shape of which code matched with area
<<<<<<< HEAD
=======
#' @export
>>>>>>> v0.1.0
submap <- function(map,area){
    code<-area2code(area)
    if(length(code)>0) {
        code1=paste0("^",code)
        temp=Reduce(paste_or,code1)
        mydata<-map[grep(temp,map$code),]
    }
}

#' Returns whether x is integer(0)
#'
#' @param x a numeric vector
is.integer0 <- function(x) { is.integer(x) && length(x) == 0L}
<<<<<<< HEAD
=======

#' Paste '|' between vectors
#' @param ... one or more R objects, to be converted to character vectors.
paste_or <- function(...) {
    paste(...,sep="|")
}
>>>>>>> v0.1.0

#' Paste '|' between vectors
#' @param ... one or more R objects, to be converted to character vectors.
paste_or <- function(...) {
    paste(...,sep="|")
}

#' Seek area from data areacode and returns the code
#'
#' @param area a string looking for
#'
#' @return a code if the area is found, else returns NA
<<<<<<< HEAD
=======
#' @export
>>>>>>> v0.1.0
area2code <- function(area){
    result<-c()
    for(i in 1:length(area)){
        pos<-grep(area[i],areacode[[2]])
        if(!is.integer0(pos)) temp<-areacode[pos,1]
        else {
            pos<-grep(area[i],areacode[[3]])
            if(!is.integer0(pos)) temp<-areacode[pos,1]
        }
        result=c(result,temp)
    }
    result
}

