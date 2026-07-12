# Python Exploratory Data Analysis

## Overview

This folder contains the Python Exploratory Data Analysis (EDA) performed on the SQL-cleaned Zomato Bangalore restaurant dataset.

The purpose of this analysis is to explore the data beyond SQL summary queries and understand distributions, outliers, customer engagement patterns, and relationships between restaurant features.

The analysis was performed using Pandas, NumPy, Matplotlib, and Seaborn.

## Dataset

The SQL-cleaned dataset contains:

- 51,155 rows
- Restaurant details such as rating, votes, location, cuisine, online ordering, table booking, and approximate cost for two

The cleaned dataset was exported from MySQL and used as the input for Python EDA.

## EDA Objectives

The Python analysis focuses on:

- Inspecting data types and dataset structure
- Identifying missing values and duplicate patterns
- Analysing rating, votes, and cost distributions
- Detecting outliers using the IQR method
- Measuring skewness in numerical variables
- Comparing mean and median values
- Studying the relationship between cost and ratings
- Studying the relationship between votes and ratings
- Analysing online ordering and table booking features
- Comparing restaurant price segments
- Exploring location-level engagement patterns
- Exploring cuisine-level performance
- Performing correlation analysis

## Statistical Analysis

The analysis also includes basic statistical techniques to validate visual findings.

- Pearson correlation
- Spearman rank correlation
- Mann–Whitney U test
- Rank-biserial correlation for effect size

These techniques were used to distinguish statistical significance from practical significance.

## Key Findings

- Votes and restaurant cost are highly right-skewed and contain several high-value outliers.
- Customer engagement has a strong positive association with restaurant ratings.
- Online ordering shows a statistically significant difference in ratings, but the effect size is small.
- Restaurants offering table booking have higher median ratings and substantially higher customer engagement.
- Premium restaurants show a strong balance between customer ratings and engagement.
- Koramangala 5th Block has high overall restaurant activity, but its average engagement is influenced by highly popular restaurants.
- Lavelle Road and Church Street show stronger engagement for a typical restaurant based on median votes.
- North Indian cuisine combinations remain strong in customer engagement, while some smaller cuisine combinations achieve higher ratings.
- Missing ratings are strongly associated with restaurants having little or no customer engagement.
- Higher restaurant cost is moderately associated with engagement but has a weaker relationship with ratings.

## Tools and Libraries

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- SciPy
- Jupyter Notebook

## File

`bangalore_restaurant_eda.ipynb` contains the complete exploratory data analysis, visualizations, statistical analysis, and interpretations.

## Conclusion

The Python EDA was used to validate and deepen the findings obtained from SQL analysis. While several SQL findings were supported, the Python analysis also showed that averages can be influenced by outliers and that statistical significance does not always indicate a strong practical relationship.

The analysis highlights the importance of combining descriptive statistics, visualizations, and statistical testing when interpreting restaurant market data.
