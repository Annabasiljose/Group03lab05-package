#' function that interacts with the API
#' @name  req_stamen_map
#' @title Function that interacts with the API
#' @param left the left coordinate of map
#' @param bottom the bottom coordinate of map
#' @param right the right coordinate of map
#' @param top the top coordinate of map
#' @param zoom_val the zoom
#' @param map_type the type of map
#' @return stamenmap
#' @import ggmap
#' @import shiny
#' @importFrom shiny validate
#' @import shinythemes
#' @import shinyvalidate
#' @import stringr
#' @importFrom jsonlite fromJSON
#'
#' @export get_country_names
#' @export req_stamen_map
#' @export get_country_coordinates
#' @export
#'
# Load R packages
library(ggmap)
library(shiny)
library(jsonlite)
library(shinyvalidate)
library(shinythemes)

#get the name and coordinates of all countries included
#' @name  get_country_names
#' @title Function that gets all the country names
#' @return json_data_frame
#' @export get_country_names
#' @export
#'
get_country_names <- function(){
  url <- "https://raw.githubusercontent.com/Annabasiljose/Group03lab05-package/master/coordinates.json"
  myData <- fromJSON(url)
  json_data_frame <- as.data.frame(myData)
  return(json_data_frame)
}

#Process and Return Map
req_stamen_map <- function(left, bottom, right, top, zoom_val,
                           map_type){
  stopifnot(zoom_val <= 5)
  stopifnot(map_type %in% c("terrain", "toner", "watercolor"))
  stamen_map <- ggmap(get_stamenmap(bbox=c(left, bottom,
          right, top), zoom = zoom_val, maptype = map_type))
  return(stamen_map)
}

#Get Country Coordinates from country name
#' @name  get_country_coordinates
#' @title Function that coordinates of country
#' @param name name of the country
#' @return coordinates
#' @export get_country_coordinates
#' @export
#'
get_country_coordinates <- function(name){
  json_data_frame <- get_country_names()
  
  if(name != ""){
    if((name %in% names(json_data_frame))){
      
      
        return(c(json_data_frame[name][1,],
                 json_data_frame[name][2,],
                 json_data_frame[name][3,],
                 json_data_frame[name][4,]))
   
    }else{
      stop("Input a valid country name!")
    }
       
    
   
  }
}
