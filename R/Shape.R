#Encoding("UTF-8")

#'Returns if x is integer(0)
#'@param x a vector
#'
#'@return a logical value: TRUE for integer(0) otherwise FALSE
is.integer0 <- function(x) {is.integer(x) && length(x) == 0L}


#'seek area from data areacode and returns the code
#'
#'@param area a string looking for
#'
#'@return a code if the area is found, else returns NA
area2code=function(area){
        result=NA
        pos=grep(area,areacode[[2]])
        if(!is.integer0(pos)) result=areacode[pos,1]
        else {
                pos=grep(areacode[[3]],area)
                if(!is.integer0(pos)) result=areacode[pos,1]
        }
        result
}

#'Select a subdata of map
#'
#'@param map an object of class Shape(SpatialPolygonsDataFrame)
#'@param area a string of area looking for
#'
#'@return Subdata of class Shape of which code matched with area
submap=function(map,area){
        code=area2code(area)
        if(is.na(code)) return(NULL)
        else mydata=map[grep(paste0('^',code),map$code),]
}


#' Merge data to an object of class SpatialPolygonsDataFrame
#'
#'@param map an object of class Shape(SpatialPolygonsDataFrame)
#'@param data a data.frame
#'@param code a name of variable of shp map data and data.frame to be matched with
#'
#'@return a Shape object with appended data
mergeData2Map=function(map,data,code="code"){

        requireNamespace(tmap)  #for append_data

        map@data$code1=as.character(map@data[[code]])

        data$code1=as.character(data[[code]])
        result=append_data(map,data,key.shp="code1",key.data="code1")
        result
}

#' Korean administrative area name with code
#'
#' A dataset containing the code and the name of Korean administrative area
#'
#' @format A data frame with 16 rows and 3 columns
#' \describe{
#'   \item{code}{code, numeric}
#'   \item{name}{the full name of Korean administrative area}
#'   \item{name2}{the abbreviation of name which is more commonly used}
#' }
"areacode"


#'A dataset contains counts of newly developed patients of a disease according
#'to Korean administrative area
#'
#' @format A data frame with 16 rows and 3 columns
#' \describe{
#'   \item{시도별}{Korean administrative area}
#'   \item{Y2001}{total number of newly developed patients in the area in 2001}
#'   \item{Y2002}{total number of newly developed patients in the area in 2002}
#'   \item{Y2003}{total number of newly developed patients in the area in 2003}
#'   \item{Y2004}{total number of newly developed patients in the area in 2004}
#'   \item{Y2005}{total number of newly developed patients in the area in 2005}
#'   \item{Y2006}{total number of newly developed patients in the area in 2006}
#'   \item{Y2007}{total number of newly developed patients in the area in 2007}
#'   \item{Y2008}{total number of newly developed patients in the area in 2008}
#'   \item{Y2009}{total number of newly developed patients in the area in 2009}
#'   \item{Y2010}{total number of newly developed patients in the area in 2010}
#'   \item{Y2011}{total number of newly developed patients in the area in 2011}
#'   \item{Y2012}{total number of newly developed patients in the area in 2012}
#'   \item{Y2013}{total number of newly developed patients in the area in 2013}
#'   \item{code}{code indicating Korean administrative area}
#' }
"tbc"

#' A data of SpatialPolygonsDataFrame contains the map of  Korean administrative area(2010), level 1
#'
#'@format A Shape data with length of 16
#'@examples qtm("kormap1")
"kormap1"


#' A data of SpatialPolygonsDataFrame contains the map of  Korean administrative area(2010), level 2
#'
#' @format A Shape data with length of 251
"kormap2"

#' A data of SpatialPolygonsDataFrame contains the map of  Korean administrative area(2010), level 3
#'
#' @format A Shape data with length of 3472
"kormap3"


#' A data of SpatialPolygonsDataFrame contains the map of  Korean administrative area, level 1
#' with merged population census data 2010
#'
#' @format A Shape data with length of 16
#'@examples qtm("korpopmap1","총인구_명")
"korpopmap1"


#' A data of SpatialPolygonsDataFrame contains the map of  Korean administrative area, level 2
#' with merged population census data 2010
#'
#' @format A Shape data with length of 251
"korpopmap2"

#' A data of SpatialPolygonsDataFrame contains the map of  Korean administrative area, level 3
#' with merged population census data 2010
#'
#' @format A Shape data with length of 3472
"korpopmap3"

