library(tidyverse)
library(osmdata)
library(sf)



streets <- getbb("Kolkata India")%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("motorway", "primary", 
                            "secondary", "tertiary")) %>%
  osmdata_sf()


small_streets <- getbb("Kolkata India")%>%
  opq()%>%
  add_osm_feature(key = "highway", 
                  value = c("residential", "living_street",
                            #"unclassified",
                            "service", "footway")) %>%
  osmdata_sf()



background_color<-'#1E212B'
street_color<-'#FAD399'
small_street_color<-'#D4B483'
font_color<-'#FFFFFF'

Calc_dark <- ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = street_color,
          size = 0.5,
          alpha = 0.6) +
  
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = street_color,
          size = 0.3,
          alpha = 0.6) +
  
  theme_void() +
  theme(plot.title = element_text(family = 'Banschrift',
                                  color=font_color,
                                  size = 18, 
                                  face = "bold", 
                                  hjust=.5,
                                  vjust=2.5),
        panel.border = element_rect(colour = "white", fill = NA, size = 3),
        plot.margin=unit(c(0.6,1.6,1,1.6),"cm")) +
  coord_sf(ylim = c(22.63, 22.45), 
           xlim = c(88.27, 88.445), 
           expand = FALSE) +
  labs(title = "Calcutta", 
       subtitle = '22.5726° N, 88.3639° E')

Calc_dark
