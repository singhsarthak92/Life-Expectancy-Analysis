#Question: Create a line graph comparing the average
#total sales per month. Aggregate the data to calculate the
#average Total sales for each month, and plot these averages
#on the y-axis against the months on the x-axis.
#Instructions:
# Read and preprocess the data.
#Extract the month and year from the Date column.
#Calculate the average Total sales for each month.
#Plot these averages and label the x-axis with month names.


data <- read.csv("C:/rdata/supermarket_sales - supermarket_sales (1).csv")
library(dplyr)
data$Date<-as.Date(data$Date,format =" %m/%d/%Y")
data$year<-format(data$Date,"%Y")
data$month<-format(data$Date,"%m")
monthly_sales<-data%>%group_by(year,month)%>%summarise(averagesales = mean(Total,na.rm = TRUE),.groups='drop')
print(monthly_sales)
monthly_sales$yearmonth<-as.Date(paste(monthly_sales$year,monthly_sales$month,'01',sep = '-'),format = '%Y-%m-%d')
print(monthly_sales) 
plot(monthly_sales$yearmonth,monthly_sales$averagesales,type = 'o',xlab = 'Months',ylab = 'averagesales',
     lwd = 2,col = "red",
     main = 'Average sales' ,xaxt = 'n')
axis(1, at = monthly_sales$yearmonth, labels =format(monthly_sales$yearmonth,"%b%y"), las = 2)
