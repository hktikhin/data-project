# Anime Recommendation System using GNN

This project is focused on developing a recommendation system for anime using machine learning techniques. The core of the recommendation system is a Graph Neural Network (GNN) model that predicts the likelihood of a link between a user and an anime node. The recommendation system is based on the Anime Recommendation Database 2020 from Kaggle, which includes 57 million ratings applied to 16,872 anime by 310,059 users, as well as synopsis information of all the anime.

## Purpose

The purpose of this project is to build a recommendation system that provides personalized anime recommendations to users based on their viewing history and preferences. The project uses different machine learning approaches, including content filtering, collaborative filtering, and graph-based methods, to compare their performance and choose the best one.

## Technologies Used

The project uses several technologies and tools, including:

- Python: the programming language used to develop the recommendation system.
- Deep Graph Library (DGL): a Python package for building graph neural networks (GNNs).
- Jupyter Notebook: an interactive environment for developing and testing the recommendation system.

## Methodology

The project follows a step-by-step methodology:

1. Data Collection: The anime rating dataset is downloaded from Kaggle and preprocessed to filter out low-rated anime and users with insufficient ratings.

2. Data Exploration: The dataset is explored to understand its structure and characteristics, such as the number of users, anime, and ratings.

3. Baseline Models: The project trains and evaluates different baseline models like content filtering and collaborative filtering to compare their performance against the graph-based methods.

4. Graph-based Models: The project trains and evaluates graph-based models like Relational Graph Convolutional Network (RGCN) and Random Walk to generate recommendations.

5. Model Evaluation: The project uses various evaluation metrics like Mean Reciprocal Rank (MRR), Precision@5, and Hit@5 to compare the performance of different models and choose the best one.


The model.ipynb file is a Jupyter notebook that demonstrates how to use the Deep Graph Library (DGL) to create a data pipeline for training GNN models. The notebook starts by importing the necessary libraries and loading the anime rating dataset from Kaggle. It then preprocesses the data by filtering out low-rated anime and users with insufficient ratings.

The notebook focuses on the GNN approach to making anime recommendations, using the Relational Graph Convolutional Network (RGCN) and Random Walk models to predict the likelihood of a link between a user and an anime node. The RGCN model uses graph-based methods to learn embeddings for nodes in the graph, while the Random Walk model simply traverses the graph to generate recommendations based on the frequency of anime appearing in the random walks.

The notebook also explains the evaluation metrics used to assess the performance of the recommendation system, such as Mean Reciprocal Rank (MRR), Precision@5, and Hit@5. The performance of each model is summarized in a table to compare their results on the validation and test sets.

Sure! Here's an example of what you could write:

## Skills Demonstrated
Through this project, we were able to demonstrate our skills in various areas, including:

- Data collection and preprocessing: We collected and preprocessed a large dataset from Kaggle, filtering out low-rated anime and users with insufficient ratings, and preparing the data for use in machine learning models.
- Data exploration: We explored the dataset to identify its structure and characteristics, such as the number of users, anime, and ratings, which helped us understand the data and its potential challenges.
- Machine learning: We developed and trained different machine learning models, including content filtering, collaborative filtering, and graph-based methods such as the Relational Graph Convolutional Network (RGCN) and Random Walk, to compare their performance and choose the best one. This involved selecting appropriate algorithms, preprocessing the data, tuning hyperparameters, and evaluating model performance.
- Graph analytics: We used graph-based methods to develop a recommendation system, leveraging the power of Graph Neural Networks (GNNs) to predict the likelihood of a link between a user and an anime node. We also used evaluation metrics such as Mean Reciprocal Rank (MRR), Precision@5, and Hit@5 to assess the performance of the models.
- Deep learning: We used the Deep Graph Library (DGL), a Python package for building GNNs, to create a data pipeline for training GNN models. This involved working with features, labels, and graphs to create embeddings for nodes in the graph.
- Python programming: We used Python to develop the recommendation system, utilizing various libraries and tools such as DGL and Jupyter Notebook to create a user-friendly and interactive environment for developing and testing the models.


The purpose of this project is to use GNN models for anime recommendation systems, demonstrating skills in graph analytics, deep learning, and Python programming. The project provides a practical example of how to build a recommendation system using graph based methods

