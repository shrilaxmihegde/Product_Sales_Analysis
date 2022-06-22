# Product Sales Analysis

## Overview of the project :

 An automated end-to-end data pipeline that will perform ***"Extract***", ***Transform***" and ***Load***" the Product Sales data and then create a considerable dashboard to visualize the product sales statistics in Tableau. Using **Machine Learning algorithms**, classify the customer data and develop an **ML** model to predict  future sales.

The Data journey starts with downloading the files from the AWS S3 bucket using ***Python*** Next dataset will undergo cleaning, filtering, and transformation using Pandas. Transformed and cleaned data will be loaded to **PostgreSQL** using sqlalchamy. Using Tableau, an interactive dashboard is built and published to Tableau server for further analysis and visulization.
 A ML model is developed with LinearRegression Model and Random Forest Classifier model to predict the future sales. Also, with the K-means algorithem (Unsupervised learning method), customer classification is done.
 
 
## Purpose :
Companies rely on final sales figures to see how they are performing. But, just looking at the revenue generated cannot help pinpoint what’s working (or not). Without metrics / statistics to guide you,
it’s hard to make educated and data-driven decisions that will benefit the  company now and in the future. This is where sales analysis comes in.

***Data Sources*** : 

Data used in this project is from  https://data.world/dataman-udit/us-regional-sales-data , which is available for public.
This data set is  normalized in nature and contains 6 different csv files. Dataset is about a US-based fictitious company's product sales from May 2018 to Dec 2020.

1. customer_data.csv
2. products_sheet.csv
3. sales_order_sheet.csv
4. sales_team_sheet.csv
5. store_location_sheet.csv
6. store_region_sheet.csv.

 The reason for choosing this data is, it provides an opportunities to demonstrate the data merging, and blending of more than one data file within Python and Tableau and treat it as one single data source. 


## High-level steps :


1. Retrieve sales related data from the AWS S3 bucket. 

2. ETL - Processing using python (Pandas, NumPy).

3. Merge the Data sets in Python and blend the dataset for visualization using  Tableau.

4. Write the clean and transformed data into PostgreSQL database tables for further usage like Dashboard & ML.

5. Create a comprehensive  interactive dashboard using Tableau.

6. Develop Machine Learning Models:
 
   * Using unsupervised learning methods, classify the customer data based on behavior like total purchased, recency, and frequency.
   
   * Develop a future sles prediction model with LinearRegression and RandomForest Classifier.

7. Define / Outline future enhancement for making this data pipeline end-to-end  automated.
 


 ## Database Schema :
  
 <img src=/Resources/product_SalesDB_ERD.png width=500>
 
 <img src=/Resources/SQL_data_table.png width=500>
 ___________________________________________________________________
 
## ETL :

1. Fetch data files from local filesystem or AWS S3 bucket  based on config in the ETL process.

2. Validate, Clean, merge and transform 6 files.

3. Write cleaned data into CSV on local f/s

4. Write the cleaned data into PostgreSQL database using SqlAlchamy


## Machine Learning (ML) :

### Supervised Machine Learning Model :
 Create a postgresql connection engine and read the data from PostgreSQL database, sales_order_sheet_processed table.

 
###  Model to predict future sales:

#### Step 1: 
While analyzing the dataset, we can see that May 2018 month has only 5 transactions, which is not a complete dataset and can have an adverse impact on the models. Hence, orders with date May 2018 were filtered out.
We can see dataset we have is not seasonal. So, LinearRegression and RandomForestClassifier algorithms can be used to develop a model to predict sales.
#### Step 2:
Derive the last 3 months sales difference for each month. Then split the data into train and test. After adding 3 months sales difference and dropping null values we end up with 28 months data. We split the first 22 months of data as train dataset and remaining 6 months as test dataset.


#### Step 3:
 
 ### Linear Regression Model :
 
Root Mean Squared Error (RMSE): 237649.6321555779

***Accuracy: 91.67%***

<img src=/Resources/Linear_Regression_Predictions.png width=500>

 
 ### RandomForestRegressor Model:
 
Root Mean Squared Error (RMSE): 195739.91049649697

***Accuracy: 91.33%***

<img src=/Resources/RandomForestRegressor.png width=500>    
 
 
 #### Result :
While comparing both the models,the RMSE value is lesser for  RandomForestRegressor. Hence, RandomForestRegressor model is better fit for this dataset.


## Unsupervised Machine Learning Model (K-means cluster):

Using Machine Learning algorithms, customers can be  classified based on their behavior like:
  1. How frequently purchased ?
  2. How recently purchased?
  3. How much purchased?

K-Means algorithm ( Unsupervised Learning Model) will help to learn and classify the customer data based on the behavior. Here K means clustering, which is derived based on the Elbow curve. 
Inertia is one of the most common objective functions to use when creating an elbow curve. Basically, the inertia objective function is measuring the amount of variation in the dataset. 

 <img src=/Resources/Elbow_curve.png width=500> 

In the above figure, we can see at 2 curve shifts to a strong horizontal line. 

### Below figures show the customer classification using different K values:
3D scatter plot

<img src=/Resources/3d_two_custer.png width=500> 

## Result : 

Using K-means algorithm, with cluster value  2, we can see a good result with customer classification.
* Class = 0 : Low-Value Customers who purchased less and frequency of purchase.
* Class = 1 : High-Value Customers based on total sales and frequency of purchase.   

## Tableau Dashboard Analysis :

#### Dashboard is available [here](https://public.tableau.com/app/profile/shrilaxmi.hegde4270/viz/Product_Sales_Analysis_UCBerkeley_Bootcamp/ProductSalesAnalysis-Story?publish=yes)
Using Tableau Public, an interactive comprehensive  dashboard is built. Tableau Dashboard will help answering below the questions to make data-driven decisions.


1. Which region has the highest average sales?
2. Which sales channel did highest sales?
3. What are the Top N and Bottom N products per year by sales?
4. How much average sales per customer by products?
5. Based on the last two years sales, what will be the sales forecast?
6. Which state has the highest sales in three years'(2018,2019,2020)?
7. Which state has the highest sales ?
8. Which group did the highest?
9. A total number of order by state? 
 
 Interactive Dashboard:
 
<img src=/Resources/Dashboard_link.png width=600>



## Summary :

A good product sales analysis can help company / business:
Sales analysis is done from the bottom level to the top level of the company.
 1. Presents long-term data you can refer back to.
 2. Offer a deeper understanding of your customer
 3. Make sense of help market trends and  data
 4. Fewer missed or lost opportunities.
 5. Better decision-making, which are data-driven.
 6. Identifies improvements area.

## Future Improvements:

1. Making end-to-end data pipeline automated.
    * Tableau Desktop with PostgreSQL  connector.
    * Tableau server a with report refresh interval

2. Advanced Machine Learning
    * Deep learning /Neural network help to understand customer behavior better
    * More reliable future forecast


3. ML Model serving (application)
    * Hosting the ML model
    * Allow users to send test data and get predictions online


## Presentation :
#### Presentation slides are available [here](https://docs.google.com/presentation/d/1PPPP-_-hWiR3mu5kvJFaVtw07xIbeAbdyPKA1V2zR2Q/edit?usp=sharing)

#### Presentation recorded version is available [here](https://youtu.be/H2Uh1BHlkjE)

### Resources :

 <img src=/Resources/Flow_chart.png width=500>
