# Autor: López Rios Cristian Daniel
# 11 de Marzo de 2024

#list.files(path=".")
#install.packages("arules")

library(arules)
library(dplyr)

my_data <- read.csv(".\\archive/transaction_data.csv")

head(my_data)

summarize(group_by(my_data, "TransactionId"), order.count = n_distinct(TransactionId))

summarize(group_by(my_data, "ItemCode"), order.count = n_distinct(ItemCode))

