# Life-Expectancy-Analysis
R project analyzing life expectancy data
Project Overview

This project analyzes the WHO Life Expectancy dataset to explore factors influencing life expectancy across countries using statistical methods and data visualization in R. The goal is to identify key predictors (e.g., Alcohol, BMI, GDP, Schooling) and model their relationship with life expectancy. The project includes data preprocessing, exploratory data analysis (EDA), correlation analysis, and multiple linear regression, demonstrating a comprehensive data analysis workflow.

Dataset
Source: World Health Organization (WHO) Life Expectancy dataset
Features: 22 features, including:
Economic: GDP, percentage expenditure
Health: Infant deaths, BMI, immunization coverage, HIV/AIDS prevalence

Social: Schooling, alcohol consumption

Outcome: Life expectancy (target variable)

Size: ~2,838 rows (after removing NA values in Life Expectancy), covering 193 countries from 2000–2015

Methods

Data Preprocessing:

Removed rows with missing Life.expectancy values using filter(!is.na(Life.expectancy)).

Handled missing values in other columns implicitly during analysis (e.g., use = "complete.obs" in correlation).

No explicit feature encoding or standardization was applied, as the focus was on linear regression.


Exploratory Data Analysis (EDA):





Calculated summary statistics (min, max, mean, median) for key variables: Life.expectancy, Alcohol, BMI, GDP, and infant.deaths.



Computed average life expectancy and infant deaths per country using group_by and summarise.



Identified the top 10 and bottom 10 countries by average life expectancy.



Visualized results with line plots for top/bottom 10 countries.



Correlation Analysis:





Calculated the correlation matrix for Life.expectancy, Alcohol, BMI, GDP, and infant.deaths using cor().



Visualized correlations with a heatmap using the corrplot package, highlighting relationships (e.g., positive correlation between GDP and life expectancy).



Modeling:





Built two linear regression models:





Simple Model: Life.expectancy ~ Alcohol + percentage.expenditure + BMI.



Multiple Regression Model: Life.expectancy ~ Alcohol + percentage.expenditure + BMI + GDP + infant.deaths + Schooling.



Evaluated models using summary statistics (e.g., R², p-values) and made predictions for new data points.



No cross-validation or hyperparameter tuning was performed.



Reporting:





Generated a Word document (Life_Expectancy_Summary.docx) with summary statistics for key variables using the officer package.



Included tables and headings for professional presentation.

Key Findings





Top Predictors: Schooling, GDP, and percentage expenditure showed stronger correlations with life expectancy, while alcohol had a weaker relationship (based on correlation matrix and regression coefficients).



Insights:





Countries like Japan and Switzerland (top 10) have average life expectancies above 80 years, driven by high GDP and schooling.

Countries like Sierra Leone and Chad (bottom 10) have life expectancies below 50 years, linked to high infant mortality and low economic resources.
Visualizations:

Correlation heatmap showing relationships between life expectancy and predictors.
Line plots of average life expectancy for the top 10 and bottom 10 countries.
Summary statistics table exported to a Word document.

Repository Structure

