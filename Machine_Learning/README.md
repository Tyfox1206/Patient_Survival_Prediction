# Patient_Survival_Prediction
Final group project for Data visualization 

Machine_Learning and Machine_Learning2 branches

## Data Exploration
Short description of our dataset’s origins and overall shape
Creation of our preliminary, sample database
Dropped all of the columns related to laboratory work
Dropped all columns with more than 5000 missing values
Encoded all fields that were objects
Dropped any patients with missing data
Raw dataset: 91,713 rows of patient data, 186 columns
Preliminary data: 72,643 rows of patient data, 73 columns

## Description of Our Preliminary Datasets

*All datasets had 73,262 rows. The number of columns varied and are displayed below.
Patient Vitals in the 1st hour in ICU (12 columns)
Patient Vitals in the 1st day in ICU (20 columns)
All Patient Vitals (32 columns)
Patient Demographics (11 columns)
Patient Database (65 columns)
APACHE Covariates for each Patient (12 columns)
APACHE Comorbidities for each Patient (10 Columns)

## Preliminary Data PreProcessing

*The Database member of our group preprocessed most of our data.

The data preprocessing that the Machine Learning part of our project is listed below:

1. The unique identifiers were removed from each dataset ('patient_id', 'encounter_id', 'hospital_id'). There was no information in our dataset about where these hospitals were located, we were only given hospital_ids, for this reason we dropped this column. The patient_id and enocounter_id were also dropped because they did not add anything to our analysis.

2. We had to convert Boolean and float data types to integers with Pandas.

3. After running all 7 datasets through our model, we found that the dataset with the highest accuracy for our model that we used for the final portion of our project was the database_patient dataset, which included the most columns. 

## Preliminary Feature Engineering and Selection

The feature for every model was the same, hospital_death.
We wanted to test for a binary outcome, and in our model 0=Survival and 1=Death

## Training and Testing Data

We used the sklearn train_test_split function for all of our datasets.

We also would check the balance for the y_train and y_test data

![Train_Test](https://user-images.githubusercontent.com/101427781/200131042-33d1033a-efba-4809-8bc4-014434e9b808.png)

## Model Choice

### Balanced Random Forest Classifier

In the mock-up machine learning model we compared the Easy Ensemble Classification Model with the Balanced Random Forest Classifier Model, and ultimately went with BRFC because it had the highest accuracy score.

![model_choice](https://user-images.githubusercontent.com/101427781/200131248-c070e030-a22c-437b-be1d-824b07787525.png)

Benefits:
Robust against overfitting and outliers
Ranks importance of input variables in a natural way
Can handle thousands of input variables 
Runs efficiently on large datasets
High accuracy and interpretability

Limitations:
The algorithm is slower than other classification models

#### Choosing the Best Balanced Random Forest Classifier Model
To obtain the best accuracy score for our mdoel, we tested differing n_estimators to see which number would give us the best result.

![BRFC_n_estimators](https://user-images.githubusercontent.com/101427781/200134837-d6f48318-779a-4e78-81d9-405a454d4e0c.png)

After collecting the results, our team decided to use n_estimators = 5000 for our final machine learning model. The accuracy score is the highest, however, beacuse of the high number of trees needed to run our model, it does take a long time for the code to run.

#### Accuracy Score

![accuracy_score](https://user-images.githubusercontent.com/101427781/200134990-2a30eb6f-95f8-48a9-ba60-62c28cddc25b.png)

#### Confusion Matrix

The confusion matrix illustrates how many of a classifier’s predictions were correct. In the confusion matrix below you can see that our model has the potential to be trained more accurately. 

![cm](https://user-images.githubusercontent.com/101427781/200134641-8ae98dc2-e42e-4401-9a67-73cce6467a3a.png)

#### Imbalanced Classification Report

![imbalanced_Classification](https://user-images.githubusercontent.com/101427781/200422806-fdebfb95-a0e8-4231-af79-aff2757c38b2.png)

