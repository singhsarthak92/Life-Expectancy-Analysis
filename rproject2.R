data1<-read.csv("C:/rdata/Life Expectancy Data.csv")
library(dplyr)
data1 <- data1 %>% 
 filter(!is.na(Life.expectancy))
print(data1)


#this gives a summary about data
summary(data1)
# Load necessary libraries
library(dplyr)
library(officer)

#  'data1' is your dataset
# Calculate summary statistics for key variables
rt <- summary(data1 %>% select(Life.expectancy, Alcohol, BMI, GDP, infant.deaths))

# Convert summary output to a data frame
rtf <- data.frame(
  Statistic = rownames(rt),
  t(rt)  # Transpose the summary data for proper formatting
)

# Create a Word document
doc <- read_docx()

# Add title to the document
doc <- doc %>%
  body_add_par("Summary Statistics of Life Expectancy Dataset", style = "heading 1")

# Add the summary statistics table to the document
doc <- doc %>%
  body_add_table(rtf, style = "table_template")

# Save the Word document
output_file <- "Life_Expectancy_Summary.docx"
print(doc, target = output_file)

# Check if the file is saved correctly
file.exists(output_file)  # This should return TRUE if the file is saved

#total countries involved
countries_name<-unique(data1$Country)
total_countries<-length(countries_name)
#print(str(data1))
#this is to show average life expectancy and average infant death of the countries 
data1 <- data1[!is.na(data1$Life.expectancy), ] #removes na values from life exp
region_le<-data1%>%group_by(Country)%>%
  summarise(averageslifeexp=mean(Life.expectancy,na.rm = FALSE),
            avginfantdeaths=mean(infant.deaths,na.rm = TRUE))%>%arrange(desc(averageslifeexp))


top_10_le<-head(region_le,10)

top_10_le$Country <- factor(top_10_le$Country, levels = top_10_le$Country)

plot(top_10_le$Country, top_10_le$averageslifeexp, type = "l", pch = 19, 
     xlab = "Country", ylab = "Average Life Expectancy",
     main = "Top 10 Countries by Average Life Expectancy", las = 2, cex.axis = 0.7)



lowest_10_le<-tail(region_le,10)

lowest_10_le$Country <- factor(lowest_10_le$Country, levels = lowest_10_le$Country)

plot(lowest_10_le$Country, lowest_10_le$averageslifeexp, type = "o", pch = 19, 
     xlab = "Country", ylab = "Average Life Expectancy",
     main = "Bottom 10 Countries by Average Life Expectancy", las = 2, cex.axis = 0.7)


regmod<-lm(Life.expectancy~Alcohol+percentage.expenditure+BMI,data=data1)
predict(regmod,newdata = data.frame(Alcohol=3,percentage.expenditure=67,BMI=20))

library(corrplot)

#  'data1' is your dataset
# Selecting relevant columns for correlation analysis
selected_columns <- data1 %>% select(Life.expectancy, Alcohol, BMI, GDP, infant.deaths)

# Calculate correlation matrix
correlation_matrix <- cor(selected_columns, use = "complete.obs")

# Print the correlation matrix
print(correlation_matrix)

# Visualizing the correlation matrix using corrplot
corrplot(correlation_matrix, method = "circle", type = "upper", 
         tl.cex = 0.8, addCoef.col = "black", 
         col = colorRampPalette(c("blue", "white", "red"))(200))

# Multiple Linear Regression Model
mult_regmod <- lm(Life.expectancy ~ Alcohol + percentage.expenditure + BMI + GDP + infant.deaths + Schooling, data = data1)

# Summary of the regression model
summary(mult_regmod)

predict(mult_regmod, newdata = data.frame(
  Alcohol = 5.2,
  percentage.expenditure = 120.7,
  BMI = 23.5,
  GDP = 18000,
  infant.deaths = 12,
  Schooling = 14.3
))

