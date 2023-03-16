##RAHUL SINGH THAKUR

##Data Pre-Processing

library(ggplot2)
library(data.table)

setwd("C:\\Users\\rahul\\OneDrive\\Desktop")

##data = read.csv("data.csv", encoding="UTF-8")

sales_data<-fread("C:\\Users\\rahul\\OneDrive\\Desktop\\data.csv")
View(sales_data)

head(sales_data,10)

tail(sales_data,10)

##We don't have a use for the invoice number and stock code as they don't provide any
##relevant information and do not aid our analysis.


cols_remove<-c("InvoiceNo","StockCode")
sales_data[, (cols_remove) := NULL]

col_remove 

#We then think about renamig columns to make it easier to call them later.but
##the columns already have callable names so we skip this step


#Sometimes , we would want to categorize our items(description col) or do some string'
#matching, so it would be better to convert everything in "description" to lowercase

sales_data$Description<- tolower(sales_data$Description)

##try to split the invoicedate column to date and time sep

sales_data$Time <- format(as.POSIXct(sales_data$InvoiceDate,format="%Y:%m:%d %H:%M:%S"),"%H:%M:%S")

sales_data$Date <- format(as.POSIXct(sales_data$InvoiceDate,,format="%Y:%m:%d %H:%M:%S"),"%Y:%m:%d")


##we check for Na values 

is.na(sales_data)

##since v8 is an unwanted column we delete it 
x<-c("V8")
sales_data[, (V8) := NULL]


##REMOVE DUPLICATES ACROSS THE ENTIRE DATASET
library(dplyr)
sales_data <- sales_data %>% distinct()


write.csv(sales_data,"cleandata.csv")

head(sales_data,10)
x<-fread("C:\\Users\\rahul\\OneDrive\\Desktop\\cleandata.csv")
head(x,10)
