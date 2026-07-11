# SQL Analysis

This folder contains the SQL analysis part of my Bangalore Restaurant Market Analysis project.

I used MySQL to explore the cleaned restaurant dataset and understand the main factors related to restaurant performance in Bangalore.

## What I Analyzed

The SQL analysis was divided into different phases:

### Restaurant Performance

I analyzed the highest-rated and most popular restaurants, restaurant chains, and their performance based on ratings and customer votes.

The main question I tried to answer was:

**Why are some restaurants more popular than others?**

### Location Analysis

I compared different locations based on restaurant count, customer votes, ratings, cost, and online ordering.

This helped me understand that a high number of restaurants does not always mean a location performs better. For example, Koramangala has high competition but also strong customer demand, while Church Street and Lavelle Road have fewer restaurants but higher engagement per restaurant.

### Cuisine Analysis

I explored the most common cuisines, highly rated cuisine combinations, customer engagement, and pricing.

North Indian and North Indian–Chinese combinations are widely available in Bangalore. I also found that some less common cuisine combinations have high ratings but are available in fewer restaurants.

### Service Features

I compared restaurants based on online ordering and table booking.

Restaurants with table booking generally showed higher ratings and customer engagement. Online ordering was also common across the market.

### Pricing Analysis

I divided restaurants into four price groups:

* Budget
* Mid-range
* Premium
* Luxury

Budget restaurants make up most of the market. However, premium restaurants showed a strong balance between average rating and customer engagement.

## SQL Skills Practiced

During this analysis, I worked with:

* GROUP BY
* COUNT, AVG and SUM
* CASE WHEN
* Subqueries
* CTEs
* Window functions
* RANK()
* Conditional aggregation
* Percentage calculations

## What I Learned

This analysis helped me understand how SQL can be used to answer business questions instead of only retrieving data.

I also learned to compare multiple metrics before making a conclusion. For example, restaurant count alone cannot measure competition, and ratings alone cannot explain restaurant popularity.

## Next Step

Next, I will use Python for Exploratory Data Analysis (EDA) to study distributions, outliers, and relationships between restaurant ratings, votes, cost, location, and service features.

