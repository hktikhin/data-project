# Graph-Based Portfolio Selection

In this project, we explored the use of graph-based methods for portfolio selection and compared their performance to traditional methods taught in class. We used data from the Dow Jones Industrial Average (DJIA) from 2016 to 2022, which contains 30 prominent companies in the US. Our research question was whether graph-based asset selection, combined with an equal weight portfolio (EWP), would have good out-of-sample performance and how sensitive these methods are to parameter estimation errors.

## Graph Construction

To construct the graph, we used the Pearson correlation of the log return of each stock. We created an edge between two nodes if their correlation was greater than or equal to a threshold, which we determined from the training data.

## Centrality-Based Asset Selection Methods

We explored two centrality-based asset selection methods: Degeneracy Ordering and Clique Centrality. Degeneracy Ordering selects independent stocks by repeatedly removing the stock with the smallest connection from the graph. Clique Centrality selects central or influential stocks based on their appearance in maximal cliques. We selected stocks with centrality values greater than or equal to a threshold.

## Cluster-Based Capital Allocation Methods

We also explored three cluster-based capital allocation methods: Waterfall Portfolio, Eigenvalue Centrality Clustering, and Graph Spectral Clustering. Waterfall Portfolio assigns equal weights to each cluster hierarchy. Eigenvalue Centrality Clustering groups the stocks into five clusters based on their centrality values calculated from the graph's random walk distribution. Graph Spectral Clustering groups the stocks into five clusters based on the eigenvectors of the graph Laplacian matrix. Hierarchical Clustering groups the stocks into clusters based on their correlation matrix distance.

## Conclusion

We found that mean variance portfolio (MVP) optimization is not good at diversification and tends to put too much weight on a single stock. MVP is a high-risk, high-return, low-diversity option. It is better to assign weight based on stocks' risk and centrality. Central stocks (cliques index) tend to be a riskier choice with a high relative risk and high variance, but less sensitive to data change. Proper parameter selection is crucial for building the graph and using the methods. Generally, graph-based methods can achieve some level of diversification but may not be optimal and can be sensitive to estimation error.

## Skills Demonstrated

Throughout this project, we demonstrated our skills in several areas, including:

- Data collection and preprocessing: We collected and processed data from multiple sources, including calculating log returns and Pearson correlations.
- Graph construction: We used graph theory to construct a weighted graph based on the Pearson correlations of the stocks.
- Centrality-based asset selection: We applied two centrality-based asset selection methods to identify stocks with high centrality values.
- Cluster-based capital allocation: We utilized three cluster-based capital allocation methods to allocate capital among the stocks.
- Data analysis and visualization: We analyzed the time-series data to identify trends and patterns and visualized the results using various plots and charts.





