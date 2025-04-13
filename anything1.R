# Load the dataset
data<-read.csv("C:/rdata/supermarket_sales - supermarket_sales (1).csv")

# Convert the Date column to Date format
data$Date <- as.Date(data$Date, format = "%m/%d/%Y")  # Adjust format if necessary

# Extract month and year
data$YearMonth <- format(data$Date, "%Y-%m")  # Extract year and month
library(dplyr)
# Calculate the average Total sales for each month
monthly_sales <- data%>%group_by(YearMonth)%>%summarise(averagesales=mean(Total,na.rm = TRUE),.groups = 'drop')

# Convert YearMonth to a proper date for plotting (first day of the month)
monthly_sales$YearMonth <- as.Date(paste0(monthly_sales$YearMonth, "-01"))

# Set up the PNG file
#png("average_total_sales_per_month.png", width = 800, height = 600)

# Create a basic line plot
plot(monthly_sales$YearMonth, monthly_sales$Total, type = "l", col = "blue",
     lwd = 2, xlab = "Month", ylab = "Average Total Sales",
     main = "Average Total Sales per Month",
     xaxt = 'n')

# Customize x-axis with month names
axis(1, at = monthly_sales$YearMonth, 
     labels = format(monthly_sales$YearMonth, "%b %Y"), 
     las = 2)  # las = 2 for vertical labels


