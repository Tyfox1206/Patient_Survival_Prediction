# Patient_Survival_Prediction
Final group project for Data visualization 

Machine_Learning2

### Data Exploration
Short description of our dataset’s origins and overall shape
Creation of our preliminary, sample database
Dropped all of the columns related to laboratory work
Dropped all columns with more than 5000 missing values
Encoded all fields that were objects
Dropped any patients with missing data
Raw dataset: 91,713 rows of patient data, 186 columns
Preliminary data: 72,643 rows of patient data, 73 columns

### Description of Our Preliminary Datasets

*All datasets had 73,262 rows. The number of columns varied and are displayed below.
Patient Vitals in the 1st hour in ICU (12 columns)
Patient Vitals in the 1st day in ICU (20 columns)
All Patient Vitals (32 columns)
Patient Demographics (11 columns)
Patient Database (65 columns)
APACHE Covariates for each Patient (12 columns)
APACHE Comorbidities for each Patient (10 Columns)

### Preliminary Data PreProcessing

The Database member of our group preprocessed most of our data.

The unique identifiers were removed from each dataset ('patient_id', 'encounter_id', 'hospital_id').

We found that the dataset with the highest accuracy for our model that we used for the final portion of our project was the database_patient dataset, which included the most columns

### Preliminary Feature Engineering and Selection

The feature for every model was the same, hospital_death.
We wanted to test for a binary outcome, and in our model 0=Survival and 1=Death

### Training and Testing Data

We used the sklearn train_test_split function for all of our datasets.

We also would check the balance for the y_train and y_test data

### Balanced Random Forest Classifier

Benefits:
Robust against overfitting and outliers
Ranks importance of input variables in a natural way
Can handle thousands of input variables 
Runs efficiently on large datasets
High accuracy and interpretability

Limitations:
The algorithm is slower than other classification models
