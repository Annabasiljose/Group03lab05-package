# Load R packages
library(ggmap)
library(jsonlite)

get_country_names <- function(){
  url <- "https://raw.githubusercontent.com/Annabasiljose/Group03lab05-package/master/coordinates.json"
  myData <- fromJSON(url)
  json_data_frame <- as.data.frame(myData)
}

#Process and Return Map
req_stamen_map <- function(left, bottom, right, top, zoom_val, 
                           map_type){
  stamen_map <- ggmap(get_stamenmap(bbox=c(left, bottom,
          right, top), zoom = zoom_val, maptype = map_type))
  stamen_map
}

#Get Country Coordinates from country name
get_country_coordinates <- function(name){
  
  if(name != ""){
    if(name %in% colnames(json_data_frame)){
      return(c(json_data_frame[name][1,],
               json_data_frame[name][2,],
               json_data_frame[name][3,],
               json_data_frame[name][4,]))
    }
  }
}