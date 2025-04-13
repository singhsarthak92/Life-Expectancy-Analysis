data<-read.csv("C:/rdata/supermarket_sales - supermarket_sales (1).csv")
#2. Extract Female Customers with High Ratings: Extract all rows where the Gender is "Female" and the Rating is above 5.0. 

female<-subset(data,Gender=="Female"&Rating>5)
print(names(female))

city1<-subset(data,City=="Yangon")
citydata<-city1$Total
tsale<-sum(citydata)
print(tsale)

write.csv(female,"feamledata.csv",row.names = FALSE)

# Assuming 'Total sales' is a column in your dataset

# Calculate summary statistics
total_sales_mean <- mean(data$`Total`, na.rm = TRUE)
total_sales_median <- median(data$`Total`, na.rm = TRUE)
total_sales_summary <- summary(data$`Total `)

# Create a data frame with the statistics
summary_stats <- data.frame(
  Statistic = c("Mean", "Median", "Min", "1st Qu.", "Median", "3rd Qu.", "Max"),
  Value = c(
    total_sales_mean,
    total_sales_median,
    min(data$`Total `,)
    quantile(data$`Total`, 0.25, na.rm = TRUE),
    quantile(data$`Total`, 0.5, na.rm = TRUE),
    quantile(data$`Total`, 0.75, na.rm = TRUE),
    max(data$`Total`, na.rm = TRUE)
  )
)

# Export the summary statistics to a CSV file
write.csv(summary_stats, "total_sales_summary.csv", row.names = FALSE)

# Alternatively, you can export the entire summary output directly
#summary_table <- as.data.frame(total_sales_summary)
#write.csv(summary_table, "total_sales_summary_full.csv", row.names = TRUE)

