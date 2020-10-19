# Clustering Block Inclusion Delay in Ethereum 2.0 Medalla Testnet

## This article is work-in-progress. 
## Please check back on October 19 noon US Eastern Time.

**Joseph Kholodenko, Gurdal Ertek**

**Summary:** We begin this analysis by clustering a dataset based on aggregated epoch data. We used KMeans and chose 8 clusters based on the silhouette score metric.
We then examine the output of the clustering and run the Dunn statistical significance test. We label the output p-vales <= 0.01 as True, else False.
Then we use box plots and bar charts to make the differences more clear.


> *"Every second is of infinite value."* ***Johann Wolfgang von Goethe***

![](./images/hourglass.png)


{% include code/inc_distance_plotplot.html %}

## Acknowledgements

We thank the authors of all the resources used in the article, as well as the Ethereum Community and Foundation. We especially thank [Jim McDonald](https://www.linkedin.com/in/jimgmcdonald/) for sharing the data used in the article and answering our many questions, [Ben Eddington](https://www.linkedin.com/in/benedgington/) for his rigorous documentation, [bluepintail](https://github.com/bluepintail) for openly sharing his/her analysis with the ethstaker community, and [Butta.eth](https://twitter.com/Butta_eth) for answering our questions on ethstaker. We also thank [Ivan Liljeqvist](https://www.linkedin.com/in/ivan-liljeqvist-697824198/) and the [Ivan on Tech](https://academy.ivanontech.com/a/27786/pVrJMEtL) team for creating a thriving community and motivating blockchain content. 


## Sign up to receive updates and analyses from us in the future:

<form action="https://formspree.io/f/xleojqvv" method="post">
  <label for="email">Your Email</label>
  <input name="Email" id="email" type="email">
  <button type="submit">Submit</button>
</form>

## Authors

<table>
  <tr>
    <td width=150px><a href="https://www.linkedin.com/in/josephkholodenko/" target="_blank"><img src="images/joseph-kholodenko.png" alt="Joseph Kholodenko"></a></td>
    <td><b>Joseph Kholodenko</b> is a freelance data science consultant. In the past he has worked as a Data Scientist at Google and taught at the Flatiron School as a Senior Lead Data Science Instructor. He is currently pursuing his MS in Computer Science with a specialization in machine learning at Georgia Institute of Technology.
    </td>
  </tr>
  <tr>
    <td width=150px><a href="https://www.linkedin.com/in/gurdalertek/" target="_blank"><img src="images/gurdal-ertek.png" alt="Gurdal Ertek"></a></td>
    <td><b>Gürdal Ertek</b> is an Associate Professor at UAE University (UAEU), Al Ain, UAE. He received his Ph.D. from Georgia Institute of Technology, Atlanta, GA, in 2001. Dr. Ertek served in educational and research organizations in Turkey, USA, Singapore, Kuwait and UAE, as well as an on-site reviewer for 50+ industrial R&D projects. His research and teaching areas include applied data science, business analytics, supply chain management, project management, and R&D management. Dr. Ertek's research and other work can be accessed through <a href="http://ertekprojects.com" target="_blank">ErtekProjects.com</a> </td>
  </tr>
</table>


## APPENDIX: Software Stack & Tools

- Data Extraction
  - [PostgreSQL](https://www.postgresql.org/) for opening the database dumb provided by Jim McDonald
  - [SQL](https://www.amazon.com/Learning-SQL-Generate-Manipulate-Retrieve/dp/1492057614) language for querying the data in PostgreSQL and exporting csv files

- Data Preparation
  - [Google Sheets](https://www.google.com/sheets/about/) for merging data from multiple SQL queries scalably on the cloud
  - [MS Excel](https://www.youtube.com/channel/UCJtUOos_MwJa_Ewii-R3cJA) for cleaning, adding new derived attributes, adding new attributes with jittering, and pivot analysis

- Univariate Analysis & Correlations
  - [Orange](https://orange.biolab.si/) data mining software

- Patterns Over Epochs & Relationships Between Attributes
  - [Tableau](https://www.tableau.com) visual analytics software for generating visualizations and computing best-fitting nonlinear regression function (polynomial functional form)

- Other
  - [Codecogs.com](https://www.codecogs.com/latex/eqneditor.php) Online LaTeX Equation Editor for generating formula images from LaTex code
  - [Paint.net](https://www.getpaint.net/index.html) image editor for editing the images
  - [Markdown language](https://guides.github.com/features/mastering-markdown/) within GitHub for generating the html code for the web

