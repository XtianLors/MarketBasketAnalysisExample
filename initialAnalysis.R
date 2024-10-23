# Autor: López Rios Cristian Daniel
# 11 de Marzo de 2024

#getwd()
list.files(path=".")
#install.packages("arules")

library(arules)
library(dplyr)
# In order to source we should be in MarketBasketAnalysisExample

#We wary, path_value.R should be used to allocate
   # the data 
source("./path_value.R")
library(rlang)
#env_names(globalenv())
#sessionInfo()
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

#__________________________DATA EXPLORATION_________________________________
   #Use case and data
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

#_________________________________ASSOCIATION RULE MINING_________________________________P.13
#Association rule mining algorithm. This method can be used to 
# generate the top N product recommendations
# requested byt he retailer for his cross-selling campaign.

#Weighted Transactions

#Obtaine a table with the unique identifier of the transaction and 
   # a table with the unique identifier of the products.


transaction.obj <- read.transactions(file = subsetPath, 
                     format="single", sep = ",", 
                     cols=c("order_id", "product_id"),
                     rm.duplicate= FALSE,
                     quote="", skip=0, encoding="unknown")

#_________________________________SUPPORT AND CONFIDENCE THRESHOLDS_________________________________P.26

#Support is needed to generate the frequent itemsets and the confidence parameter is required to filter the induced 
#   rules from the frequent itemsets. Support and confidence are broadly called interest measures. There are a lot of
#   interest measures in addition to support and confidence.
#   Leverage interest measurement.
#   read.transactions from arules. Order ID, product ID.
#1 Find the most frequent transaction, calculate the percentage of transactions.
transactions.obj <- read.transactions()

# A group of products IDs are called an itemset. Calculate transaction frequency of all itemsets.


#Support is a parameter that we pass to this algorithm, a value between 0 and 1.
#Let's suppose we set the value to 0.1. We now say an itemset is considered frequent, and it should be used in 
# the subsequent phase if, and only if, it appears in at least 10 percent of the transactions.
#Discard those values below the support threshold.
#

#https://rpubs.com/joaquin_ar/397172
#https://mhahsler.github.io/Introduction_to_Data_Mining_R_Examples/book/association-analysis-basic-concepts-and-algorithms.html
#https://github.com/mhahsler/arules
#https://es.wikipedia.org/wiki/Viktor_Orb%C3%A1n
#


#_________________________________THE CROSS SELLING CHAMPAIGN_________________________________P.26


#LEVERAGE P.33



#CONVICTION P. 34



#_________________________________WEIGHTED ASSOCIATION RULE MINING_________________________________P.35






#_________________________________HYPERLINK-INDUCED TOPIC SEARCH (HITS)_________________________________P.42




#_________________________________NEGATIVE ASSOCIATION RULES_________________________________P.50



#_________________________________RULES VISUALIZATION_________________________________P.53

# Web App





#Glossary
#Itemset: 





