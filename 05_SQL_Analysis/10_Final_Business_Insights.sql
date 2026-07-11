# Phase 10 — Key SQL Findings

This phase summarises the main patterns identified during the SQL analysis. These findings will be further explored during Python EDA before making final business recommendations.

## Restaurant Performance

* Byg Brewski Brewing Company stood out with a 4.9 average rating and more than 16,500 average votes, making it one of the strongest performers in the dataset.
* Most highly engaged restaurants had ratings above 4.2. Table booking was also common among these restaurants, while online ordering was mixed.
* This pattern was especially visible among pubs, breweries and dine-in focused restaurants, where table booking appeared more common than online ordering.

## Location Patterns

* BTM had the highest restaurant concentration with 5,114 records, but Koramangala 5th Block recorded the highest customer engagement with more than 1.84 million votes.
* Koramangala 5th Block had 2,407 restaurant records and still averaged 767 votes per restaurant, showing that its large restaurant presence is supported by strong customer engagement.
* Church Street recorded the highest average engagement at 995 votes per restaurant, followed by Lavelle Road at 911. Both had far fewer restaurant records than Koramangala 5th Block.
* Therefore, fewer restaurants should not automatically be interpreted as lower competition. Restaurant supply needs to be compared with customer engagement.

## Cuisine Patterns

* North Indian was the most common cuisine category with 2,890 restaurant records and also recorded the highest total votes.
* However, some cuisine combinations generated strong engagement despite having fewer restaurants. For example, Pizza, Cafe and Italian restaurants recorded 338,440 votes across only 84 restaurant records.
* Specialised and multi-cuisine combinations frequently appeared among the highest-rated cuisine groups. Results based on very small restaurant counts were treated cautiously.

## Service Features

* Restaurants offering both online ordering and table booking recorded a 4.12 average rating and around 1,100 average votes.
* Restaurants offering table booking but not online ordering recorded the highest average rating of 4.15.
* Restaurants offering neither service had the lowest average rating at 3.54 and lower customer engagement.
* The results show a clear association between service availability and restaurant performance, but they do not prove that these services directly cause higher ratings or engagement.

## Price Segment Patterns

* Budget restaurants formed 65.34% of the dataset, making them the dominant price segment.
* Premium restaurants recorded the highest average customer engagement at approximately 1,118 votes and maintained a 4.11 average rating.
* Luxury restaurants had the highest average rating at 4.12 but lower average engagement than premium restaurants.
* Based on the SQL results, the premium segment showed the strongest balance between customer rating and engagement.

## SQL Analysis Summary

The SQL analysis highlighted three major patterns: strong customer engagement can support locations with a large restaurant presence, highly engaged restaurants often maintain strong ratings and dine-in service features, and premium restaurants show a strong balance between rating and customer engagement.

These findings are treated as preliminary patterns. Python EDA will be used to examine distributions, outliers and relationships between variables before final business recommendations are made.

