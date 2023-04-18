register_google(key = "AIzaSyA5yZ_Yaz0bNCmX9t6EsZD1x9NaAsmAqKo")
library(ggmap)

queens_retail <- read.csv("/Users/sarakim/Documents/GIS_geoprocessing_assignment/queens_retail_for_lease_4_7_updated.csv", header=TRUE)

nrow(queens_retail) #177
str(queens_retail)

queens_retail_long_lat <- mutate_geocode(queens_retail, Address)
queens_retail_long_lat

sum(is.na(queens_retail_long_lat))
#54
View(queens_retail_long_lat)

#Remove rows with NA in a specific column
queens_retail_no_NAs <- queens_retail_long_lat[!is.na(queens_retail_long_lat$lon),]
sum(is.na(queens_retail_no_NAs)) # 0
nrow(queens_retail_no_NAs) # 150


write.csv(queens_retail_no_NAs, "/Users/sarakim/Documents/GIS_geoprocessing_assignment/queens_retail_no_NAs.csv", row.names = FALSE)
