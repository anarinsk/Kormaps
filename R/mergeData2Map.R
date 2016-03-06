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
