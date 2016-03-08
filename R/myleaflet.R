require(leaflet)
require(magrittr)


#'Create a Leaflet map widget with multiple map layers and control
#'
#'@param map a data object (currently supported objects are matrices, data frames,
#'        and spatial objects from the sp package of classes SpatialPoints,
#'        SpatialPointsDataFrame, Polygon, Polygons, SpatialPolygons,
#'        SpatialPolygonsDataFrame, Line, Lines, SpatialLines, and SpatialLinesDataFrame)
#'@param palette The colors or color function that values will be mapped to
#'@param choices a character vector specify the column name of map data which being used as a color scale
#'@param popupcol a string specify the column name of map data which being used as a pop-up window
#'
#'@return A HTML widget object, on which we can add graphics layers using %>% (see examples)
#'@export
myleaflet=function(map,choices,popupcol=NULL,palette="Reds",tile=NULL){

        res=leaflet::leaflet(map)
        if(is.null(tile)) res<-leaflet::addTiles(res)
        else res<-leaflet::addProviderTiles(res,tile)
        count=length(choices)
        Palette<-list()
        mypopup<-list()
        for(i in 1:count){
                Palette[[i]] <- leaflet::colorNumeric(palette = palette, domain=map[[choices[i]]])
                if(is.null(popupcol)) popupcol="name"
                mypopup[[i]]=paste0(map@data[[popupcol]],":",map@data[[choices[i]]])
                res=leaflet::addPolygons(res,stroke=FALSE,
                                smoothFactor = 0.2,
                                fillOpacity = .8,
                                popup=mypopup[[i]],
                                color= ~Palette[[i]](map@data[[choices[i]]]),
                                group=choices[i]
                )
                # %>%
                #         addLegend(position = "bottomright",
                #                   pal = Palette[[i]], values = ~map@data[[choices[i]]],
                #                   title=choices[i]
                #         )
        }
        if(count>=1){
                res=leaflet::addLayersControl(res,
                                     baseGroups=choices,
                                     position = "bottomleft",
                                     options = leaflet::layersControlOptions(collapsed = FALSE)
                )
        }
        res
}
