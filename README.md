# Product Sales Analysis

## Overview of the project :

 An automated end-to-end data pipeline which will perform ***"Extract***", ***Transform***" and ***Load***" the Product Sales data and then create a considerable dashbaord to visulaize the product sales statistics in Tableau. Using **Machine Learning algorithms**, classify the customer data and develope a **ML** model to predict the future sales.

 Data journey starts with downloading the files from AWS S3 bucket using ***Python*** Next dataset will undergo cleaning, filtering and transformation using Pandas. Transforemd and cleaned data will be loaded to **PostgreSQL** using sqlalchamy. Using Tableau, an interactive dashboard is built and published to Tableau server for further analysis and visulaization.
 A ML model is developed with LinearRegression Model and RandomForest Classifier model to predict the future sales. Alos, with K-means algorithom (Unsupervised learning method), customer classification is done.
 
 
## Purpose :
Companies rely on final sales figures to see how they are performing. But, just looking at the revenue generated cannot help pinpoint what’s working (or not). Without metrics / statistics to guide you,
it’s hard to make educated and data-driven decisions that will benefit the  company now and in the future. This is where sales analysis comes in.

***Data Sources*** : 

Data used in this project is from  https://data.world/dataman-udit/us-regional-sales-data , which is available for public.
This data set is a normalized in nature and contains 6 different csv files. Dataset is about a US based fictious company's product sales from May 2018 to Dec 2020.

1. customer_data.csv
2. products_sheet.csv
3. sales_order_sheet.csv
4. sales_team_sheet.csv
5. store_location_sheet.csv
6. store_region_sheet.csv.

Reason for chosing this data is, it provides an opportunities to demosnstarte the data merging, and blending more than one data files within Python and Tableau and treat it as one single data source. 


## High level steps :


1. Retrive sales related data from AWS S3 bucket. 

2. ETL - Processsing using python (Pandas, numpy).

3. Merge the Data sets in Python and blend the dataset for visualization using  Tableau.

4. Write the clean and transformed data into PostgreSQL database tables for further usage like Dashaboard & ML.

5. Create a comprehenssive  interactive dashboard using Tableau.

6. Develop Machine Learning Models:
 
   * Using unsupervised learning methods, classify the customer data based on behaviour like Total purchased, recency and frequency.
   
   * Develop a future slaes prediction model with LinearRegression and RandomForest Classifier.

7. Define / Outline future enahancement for making this data pipeleine end to end automated.
 


 ## Database Schema :
  
 <img src=/Resources/product_SalesDB_ERD.png width=500>
 
 <img src=/Resources/SQL_data_table.png width=500>
 ___________________________________________________________________
 
## ETL :

1. Fetch data files from local filesystem or AWS S3 buckert based on config in the ETL process.

2. Validate, Clean, merge and transform 6 files.

3. Write cleaned data into csv on local f/s

4. Write the cleaned data into PostgreSQL database using Sqlalchamy


## Machine Learning (ML) :

### Supervised Machine Learning Model :
 Create a postgresql connection engine and read the data from postgreSQL database, sales_order_sheet_processed table.

 
###  Model to predict future sales:

#### Step 1: 
While analyzing the dataset, we can see May 2018 month has only 5 transactions, which is not a complete dataset and can have adverse impact on the models. Hence, orders with date May 2018 were filtered out.
We can see dataset we have is not a seasonal. So, LinearRegression and RandomForestClassifier algorithms can be used to develop a model to preddict the sales.
#### Step 2:
Derive last 3 months sales diffrence for each month. Then split the data into train and test. After adding 3 months sales diffrence and dropping null values we end up with 28 months data. We split first 22 months data as train dataset and remaining 6 months as test dataset.


#### Step 3:
 
 ### Linear Regression Model :
 
Mean Absolute Error (MAE): 197492.8501748511

Mean Squared Error (MSE): 56477347663.681496

Root Mean Squared Error (RMSE): 237649.6321555779

Mean Absolute Percentage Error (MAPE): 8.33

***Accuracy: 91.67%***

<img src=/Resources/Linear_Regression_Predictions.png width=500>

 
 ### RandomForestRegressor Model:
 
Mean Absolute Error (MAE): 154779.7333333333

Mean Squared Error (MSE): 38314112561.17665

Root Mean Squared Error (RMSE): 195739.91049649697

Mean Absolute Percentage Error (MAPE): 8.67 

***Accuracy: 91.33%***

<img src=/Resources/RandomForestRegressor.png width=500>    
 
 
 #### Result :
While comparing both the models, RMSE value is lesser for  RandomForestRegressor. Hence, RandomForestRegressor model is better fit for this dataset.


## Unsupervised Machine Learning Model (K-means cluster):

Using Machine Learning algorithms, customers can be classifiled based on the behavior like:
  1. How frequently purchased ?
  2. How recently purchased?
  3. How much purched?

K-Means algorithm ( Unsupervised Learning Model) will help to learn and classify the customer data based on the behavior. Here K means clustering, which is dervied based on the Elbow curve. 
Inertia is one of the most common objective functions to use when creating an elbow curve. Basically the inertia objective function is measuring the amount of variation in the dataset. 

 <img src=/Resources/Elbow_curve.png width=500> 

In above figure, we can see at 2 curve shifts to a strong horizontal line. 

### Below figures show the customer classification using different K values:

<img src=/Resources/3d_two_custer.png width=500> 

## Result : 

Using K-means algorithm, with clsuter value  2, we can see the good result with customer classification.
* Class = 0 : Low Value Customers who purchased less and frequency of purchase.
* Class = 1 : High Value Customers based on total sales and frequency of purchase.   

## Tableau Dashboard Analysis :

#### Dashboard is available [here](https://public.tableau.com/app/profile/shrilaxmi.hegde4270/viz/Product_Sales_Analysis_UCBerkeley_Bootcamp/ProductSalesAnalysis-Story?publish=yes)
Using Tableau Public, an interactive comprehenssive dashbaord is built. Tableau Dashboard will help answering below questioons to make data driven decisiosns.


1. Which region has the highest average sales?
2. Which sales channel did highest sales?
3. What are the Top N and Bottom N products per year by sales?
4. How much average sales per customer by products ?
5. Based on the last two years sales, what will be the sales forecast?
6. Which state has the highest sales in three years(2018,2019,2020)?
7. Which state has the highest sales ?
8. Which group did the highest ?
9. Total number of order by state ? 

<img src=/Resources/Dashboard_link.png width=600>



## Summary :

A good product sales analysis can help company / business:
 1. Presents long term data you can refer back to.
 2. Offer deeper understanding about your customer
 3. Make sense of help market trends and  data
 4. Fewer missed or lost opportunities.
 5. Better decision making, which are data driven.
 6. Identifies improvements area.

## Future Improvements:

1. Making end-to-end data pipeline automated.
    * Tableau Desktop with postgreSQL connector.
    * Tableau server with report refresh interval

2. Advanced Machine Learning
    * Deep learning /Neural network help to understand customer behavior better
    * More reliable future forecast


3. ML Model serving (application)
    * Hosting the ML model
    * Allow users to send test data and get prediction online


## Presentation :
#### Presentation sliders are avaibale [here](https://docs.google.com/presentation/d/1PPPP-_-hWiR3mu5kvJFaVtw07xIbeAbdyPKA1V2zR2Q/edit?usp=sharing)

#### Presentation recorded version is avaibale [here](https://youtu.be/AR5KLTmyuG4)

### Resources :

 <img src=/Resources/Flow_chart.png width=500>
