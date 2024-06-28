# Autor: López Rios Cristian Daniel
# 11 de Marzo de 2024

list.files(path=".")
#install.packages("arules")

library(arules)
library(dplyr)
# In order to source we should be in MarketBasketAnalysisExample
source("./path_value.R")

#This function helps to identify the data structure and standards used in the data set.
   #This function belongs to data mining since sometimes data doesn't load in a standard way.
   #It is meant to help identify data inconsistencies and format.
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
#readerOfData(rawDataPath, spitter = TRUE)

full_data <- read.csv(rawDataPath)
typeof(full_data)
str(full_data)
dim(full_data)
class(full_data)

head(full_data)
tail(full_data)

head(full_data[1,])
#tail(full_data$)

#Convert the whole data.table as a tibble
wholeRetailData <- as_tibble(full_data)

#Eliminate the comparison with previous 
# my_data <- read.csv(path)
# typeof(my_data)
# str(my_data)
# dim(my_data)
# class(my_data)
# 
# head(my_data)
# tail(my_data)
# 
# retailData <- as_tibble(my_data)

# Use tibble (dplyr) functions to summarize the appropriate data set for initial
   # analysis.
# We should focus on a few variables. Since we care about transactions, lets only
   #use transaction ID and product ID.

View(wholeRetailData)
gather()

newRetailData <- wholeRetailData %>%
                    select(TransactionId, ItemDescription, NumberOfItemsPurchased, CostPerItem)

# Checking for the retail data gathered
newRetailData %>% 
   distinct(TransactionId)

newRetailData %>%
   group_by(TransactionId) %>%
   summarize(order.count = n_distinct(TransactionId))



summarize(group_by(retailData, "TransactionId"), order.count = n_distinct(TransactionId))

summarize(group_by(retailData, "ItemCode"), order.count = n_distinct(ItemCode))

d_fromcsv <- data.frame("ItemCode" =my_data$ItemCode, "TransactionId" =my_data$TransactionId)
head(d_fromcsv)
write.csv(d_fromcsv, "transIDitemCODE.csv")

#Weighted Transactions


# Web App









