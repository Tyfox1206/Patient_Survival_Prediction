# Patient_Survival_Prediction

# Database 

## Creating the Provisional Database

The original dataset had 91,713 rows of and 186 columns patient data. In order to prepare a sample dataset for testing our early machine learning algorithm (and begin exploring the data), we needed to perform a number of transformations. These included:

** Dropping all of the columns related to lab work for each patient** - although we will likely use some of these fields in our final model, we decided to eliminate these columns in order to reduce the size of our dataset to something some manageable for testing. Many of them had a high proportion of null values and would likely be dropped eventually. This step reduced the number of fields to 110.

**- Dropping all columns with more than 5000 missing values** - because so many fields were missing large numbers of values, they needed to be removed. The threshold of 5000 was selected after trying cutoff values higher and lower than that amount. We felt that a threshold of 5000 still gave us a significant remaining dataset to work with. This step reduced the number of fields to 73.

**- Encoding items indicated as 'object' data types** - to prepare our dataset for our model, we encoded the seven fields that incliuded non-numerical data.

**- Dropping patient rows with missing data** - after removing the columns with a high proportion of missing data, there were still patients with missing data sporatically throughout their record (which is reasonable considering how many measurements and labs are taken in an ICU). We considered using a data imputation method to replace the missing values, but decided to remove any patient with any missing data from the dataset. After this step we still have a sizeable dataset of 72,643 rows.

