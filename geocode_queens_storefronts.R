register_google(key = "[API KEY]")
library(ggmap)

queens_retail <- read.csv("[filepath]/file.csv", header=TRUE)

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


write.csv(queens_retail_no_NAs, "[filepath]/file.csv", row.names = FALSE)
