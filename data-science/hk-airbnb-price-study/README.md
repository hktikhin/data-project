# Hong Kong Airbnb Price Study

This project aims to study the factors that influence the price of Airbnb homes in Hong Kong. The hypothesis is that the location and type of host affect the price of an Airbnb listing. The data will be downloaded from the Airbnb website. The data will include information such as price, room size, number of rooms, type of property, proximity to the city or key landmarks, and reviews. The data will be handled using linear regression, random forest, and clustering. The goal is to classify or predict high-performing, expensive, or high-revenue listings based on the listing and host features.

## Skills Demonstrated

Throughout this project, we were able to showcase our skills in various areas, including:

- Data collection and preprocessing: We demonstrated our ability to gather and clean data from different sources, including web scraping and data cleaning.
- Data analysis and visualization: We showcased our skills in using tools such as pandas, matplotlib, and seaborn to analyze and visualize the data, and identify patterns and trends.
- Machine learning: We demonstrated our expertise in machine learning by building and training models to predict the price of Airbnb homes in Hong Kong. This involved selecting appropriate algorithms, preprocessing the data, tuning hyperparameters, and evaluating model performance.
- Communication: We were able to effectively communicate our findings and insights through clear and concise presentations, using visualizations and other methods to help convey our message.

## Data Collection

The data will be downloaded from the Airbnb website. The data will include information such as price, room size, number of rooms, type of property, proximity to the city or key landmarks, and reviews.

## Preprocessing

The data will be cleaned and transformed using pandas. This will include removing columns with low normalized variance and high missing values, removing irrelevant columns, imputing missing values, calculating the distance to the nearest MTR station using longitude and latitude of the listing, assuming 50% of guests will publish a review, creating three dependent variables based on some formula, creating dummy variables for property type, room type, and amenities type, and changing textual information into word count. Outliers will also be detected and removed if necessary.

## Feature Selection

Feature importance will be determined using linear regression and random forest models. Correlated features will be removed using hierarchical clustering. One feature from each cluster will be selected.

## Model Selection

Lasso regression and random forest regression will be used for the ML task. 10-fold cross-validation will be used to evaluate the model performance.

## Conclusion

This project will provide insights into the factors that influence the price of Airbnb homes in Hong Kong. The results can be used for pricing strategies for Airbnb hosts and for making decisions for Airbnb guests.