library(tidyverse)
library(osmdata)
library(sf)
library(showtext)


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



background_color2 <-'#faf9ed'
street_color2 <-'#13130c'
small_street_color2 <-'#37261a'
font_color2 <-'#13130c'

calc_light <- ggplot() +
  geom_sf(data = streets$osm_lines,
          inherit.aes = FALSE,
          color = street_color2,
          size = .4,
          alpha = .8) +
  geom_sf(data = small_streets$osm_lines,
          inherit.aes = FALSE,
          color = small_street_color2,
          size = .2,
          alpha = .6) +
  coord_sf(ylim = c(22.63, 22.45), 
           xlim = c(88.27, 88.445), 
           expand = FALSE) +
  labs(title = "Calcutta, my Love") + 
  theme_void() +
  theme(plot.title = element_text( family = 'Banschrift',
                                   color=font_color2,
                                   size = 18, face="bold", hjust=0.5),
        panel.border = element_rect(colour = font_color2, fill=NA, size=3),
        plot.margin=unit(c(0.6,1.6,1,1.6),"cm"),
        plot.background = element_rect(fill = background_color2))

calc_light
