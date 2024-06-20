# Autor: López Rios Cristian Daniel
# 11 de Marzo de 2024

#list.files(path=".")
#install.packages("arules")

library(arules)
library(dplyr)
source("./path_value.R")

readerOfData <- function(path, spitter = FALSE )
{

   insiderData <- read.csv(path)
  
   if(spitter)
   {
      values <- paste("Type of data: ", typeof(insiderData), "\n",
        "Structure of the data:  ", str(insiderData), "\n",
        "Dimensions of the data: ", dim(insiderData), "\n",
        "Class of the data: ", class(insiderData), "\n"
      )
   }
   return(paste(values, head(insiderData), tail(insiderData))) 
}
readerOfData(rawDataPath, spitter = TRUE)

full_data <- read.csv(rawDataPath)
typeof(full_data)
str(full_data)
dim(full_data)
class(full_data)

head(full_data)
tail(full_data)

retailData <- as_tibble(my_data)

my_data <- read.csv(path)
typeof(my_data)
str(my_data)
dim(my_data)
class(my_data)

head(my_data)

retailData <- as_tibble(my_data)

summarize(group_by(retailData, "TransactionId"), order.count = n_distinct(TransactionId))

summarize(group_by(retailData, "ItemCode"), order.count = n_distinct(ItemCode))

d_fromcsv <- data.frame("ItemCode" =my_data$ItemCode, "TransactionId" =my_data$TransactionId)
head(d_fromcsv)
write.csv(d_fromcsv, "transIDitemCODE.csv")


