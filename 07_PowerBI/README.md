# 📊 Bangalore Restaurant Market Analysis Dashboard

## Overview

This Power BI dashboard presents an interactive business intelligence solution for analyzing the Bangalore restaurant market. It transforms cleaned restaurant data into actionable insights, enabling users to explore market distribution, customer engagement, pricing patterns, cuisine trends, and service features.

The dashboard was developed using data that was cleaned in SQL and analyzed through Python Exploratory Data Analysis (EDA), ensuring that the visualizations are supported by data-driven decisions.

---

## Dashboard Objectives

The dashboard answers the following business questions:

- Which locations have the highest concentration of restaurants?
- Which locations receive the highest customer engagement?
- Does pricing influence customer engagement?
- Do restaurants offering online ordering receive more customer engagement?
- Does table booking impact customer engagement?
- Which cuisines dominate the Bangalore restaurant market?

---

## Dashboard Pages

### 📄 Page 1 – Executive Dashboard

Provides a high-level overview of the Bangalore restaurant market through:

- KPI Cards
  - Total Restaurant Listings
  - Average Rating
  - Median Customer Votes
  - Average Cost for Two

- Top 10 Locations by Restaurant Listings
- Top 10 Locations by Customer Engagement
- Customer Engagement by Price Segment
- Customer Engagement by Online Ordering
- Customer Engagement by Table Booking
- Top 10 Cuisines by Restaurant Listings

Interactive slicers allow users to filter the dashboard by:

- Location
- Price Segment
- Online Ordering
- Table Booking

---

### 📄 Page 2 – Restaurant Explorer

A detailed exploration page allowing users to interactively browse restaurant information using multiple filters.

The page includes:

- Restaurant Details Table
- Dynamic filtering
- Interactive exploration of restaurant attributes

---

## Key Business Insights

- BTM has the highest number of restaurant listings, indicating intense market competition.
- Lavelle Road records the highest median customer engagement.
- Premium restaurants receive the highest median customer votes.
- Restaurants offering online ordering generally show higher customer engagement.
- Restaurants providing table booking also demonstrate stronger customer engagement.
- North Indian cuisine has the highest market presence in Bangalore.

---

## Analytical Approach

During Python Exploratory Data Analysis, the distribution of customer votes was found to be highly right-skewed with several extreme outliers.

Therefore, **Median Votes** was used instead of **Average Votes** in the Power BI dashboard because it better represents the typical level of customer engagement.

This analytical decision ensures more reliable comparisons across locations, price segments, and service features.

---

## Dashboard Preview

### Executive Dashboard

> *(Insert Executive Dashboard Screenshot Here)*

---

### Restaurant Explorer

> *(Insert Restaurant Explorer Screenshot Here)*

---

## Tools Used

- Microsoft Power BI Desktop
- Power Query
- DAX Measures
- Interactive Visualizations
- Slicers
- Data Modeling

---

## Dashboard Features

- Interactive filtering
- Dynamic KPI cards
- Business-focused visualizations
- User-friendly layout
- Executive reporting dashboard
- Restaurant exploration page

---

## Future Enhancements

- Time-series trend analysis
- Customer review sentiment analysis
- Predictive analytics using Machine Learning
- Real-time dashboard integration

