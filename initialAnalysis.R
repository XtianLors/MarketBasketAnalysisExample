# Autor: López Rios Cristian Daniel
# 11 de Marzo de 2024

#list.files(path=".")
#install.packages("arules")

library(arules)
library(dplyr)

my_data <- read.csv(".\\archive\\transIDitemCODE.csv")

head(my_data)

summarize(group_by(my_data, "TransactionId"), order.count = n_distinct(TransactionId))

summarize(group_by(my_data, "ItemCode"), order.count = n_distinct(ItemCode))

d_fromcsv <- data.frame("ItemCode" =my_data$ItemCode, "TransactionId" =my_data$TransactionId)
head(d_fromcsv)
write.csv(d_fromcsv, "transIDitemCODE.csv")


