# global-housing-price-prediction
### Background 
Housing related investment(like REIT and real estate) can provide attractive and stable investment returns over the past few decade. However, there are still a lot of risk involving when investing in housing. Therefore, we may want to know which countries have lower risk and higher expected return in order to make the smart decision to invest.

### Project Objective 
The purpose of this project is to answer the following question:
- Which country have versatile return for housing investment from 2012 - 2022?
- Which country have the hightest mean return for housing investmen from 2012 - 2022?
- What is the performance of investment for each country from 2012 - 2022?
- What features have predictive power to the housing price movement?
- What is the potential return and variability if using machine learning approach to help investment in housing?
- Is machine learning model perform better comparing to the baseline model?

### What have I learnt in the project 
- Start from making sure your data is clean and informative 
- Conduct your analysis based on different angle(desciptive/ predictive/ causual/ prescriptive/...)
- Always compare performance with baseline model
- Ask SMART(**S**pecific/ **M**easurable/ **A**ctionable / **R**elevant / **T**ime) question

## Notebooks

This project contains the following Jupyter notebooks:

- `simple_analysis.ipynb`: this notebook uses simple statistics to analyze the housing investment returns for different countries from 2012-2022.

- `combine_data.ipynb`: this notebook reads data from the OECD and World Bank, transforms it from wide to long format, and combines it into a single dataset.

- `data_preprocessing.ipynb`: this notebook preprocesses the raw data, performing feature engineering, normalization and scaling, and splitting the data into training and testing sets.

- `model_building.ipynb`: this notebook uses machine learning techniques to model the housing price movement and predict potential returns and variability for different countries.

### Further Question
- Can I use clustering to understand the price trend for different countries better?
- What if we are not trading quarterly but dayly or yearly?
- Should I impute the data to avoid information loss?
- How can we identify bubble for housing market(When will housing market crash)?

### Remark
- The result of this analysis is based on the past data. It is not reliable and recommanded for furture invesement.

Sure! Here's an example of what you could write:

## Skills Demonstrated

Through this project, we were able to demonstrate our skills in various areas, including:

- Data collection and preprocessing: We collected and preprocessed data from various sources, including the OECD and World Bank, and transformed it into a format suitable for time series modeling. This involved data cleaning, feature engineering, normalization and scaling, and splitting the data into training and testing sets.
- Time series modeling: We used linear regression models with the greedy algorithm for feature selection and evaluated the model's performance using cross-validation techniques, including walk-forward validation, to avoid overfitting. We also used random forest and lasso regression to determine feature importance.
- Machine learning: We used machine learning techniques to model the housing price movement and predict potential returns and variability for different countries. This involved selecting appropriate algorithms, preprocessing the data, tuning hyperparameters, and evaluating model performance.
- Data analysis and visualization: We analyzed the data to identify trends and patterns and visualized the results using various plots and charts, such as time series plots and scatter plots.
- Communication: We effectively communicated our findings and insights through clear and concise presentations, using visualizations and other methods to help convey our message.