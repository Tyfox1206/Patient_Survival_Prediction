# Patient Survival Prediction
### Team 5 
* Brian Bulter – Database
* Emilie Lance – Machine Learning
* Tyler Fox – Github/Dashboard 
* Full team - Presentation


## Overview
Our team was interested in analyzing Healthcare data for our final project. While exploring different datasets, a group member came across a very large kaggle dataset pertaining to patients in the ICU. This dataset leant itself well to the classification machine learning model we wanted to create.

This dataset is the [“Patient Survival Prediction Dataset.”]( https://www.kaggle.com/datasets/sadiaanzum/patient-survival-prediction-dataset) This dataset was sourced from Kaggle, and on the Kaggle page it has [“Critical Care Medicine”](https://journals.lww.com/ccmjournal/Citation/2019/01001/33__THE_GLOBAL_OPEN_SOURCE_SEVERITY_OF_ILLNESS.36.aspx) journal listed as the source. This was a Star Research presentation listed as “The Global Open Source Severity of Illness Score.” 

## Questions We Hope to Answer with Our Analysis
 * How accurate can we get a machine learning model with dataset?
 * Top ten features of the data for ICU survivability?
 * Can our model predict outcomes as well if not better then the Apache Scores?

## Google Slides
[Here is a link to our slide deck for out project](https://docs.google.com/presentation/d/1tqfkghh-dxVE-MiiTn7kj0nsAiQ8NWGiNQQ4aSdb_-s/edit#slide=id.g13cbd3b1228_0_15)

# Database

## Creating the Provisional Database

The original dataset had 91,713 rows of and 186 columns patient data. In order to prepare a sample dataset for testing our early machine learning algorithm (and begin exploring the data), we needed to perform a number of transformations. These included:

1. Dropping all of the columns related to lab work for each patient - although we will likely use some of these fields in our final model, we decided to eliminate these columns in order to reduce the size of our dataset to something some manageable for testing. Many of them had a high proportion of null values and would likely be dropped eventually. This step reduced the number of fields to 110.

2. Dropping all columns with more than 5000 missing values - because so many fields were missing large numbers of values, they needed to be removed. The threshold of 5000 was selected after trying cutoff values higher and lower than that amount. We felt that a threshold of 5000 still gave us a significant remaining dataset to work with. This step reduced the number of fields to 73.

3. Encoding items indicated as 'object' data types - to prepare our dataset for our model, we encoded the seven fields that incliuded non-numerical data.

4. Dropping patient rows with missing data - after removing the columns with a high proportion of missing data, there were still patients with missing data sporatically throughout their record (which is reasonable considering how many measurements and labs are taken in an ICU). We considered using a data imputation method to replace the missing values, but decided to remove any patient with any missing data from the dataset. After this step we still have a sizeable dataset of 72,643 rows.

## Data Exploration

In addition to exploring our own dataset, the team began learning about the Acute Physiology and Chronic Health Evaluation (APACHE) system - a tool the helps ICU personnel to predict mortality of patients and classify them. 
Our database includes the factors and covariates that contribute to APACHE scores, so we were interested in measuring our machine learning algorithm’s performance against an established model like APACHE. 
In order to facilitate a direct comparison between the two, we decided to create some ROC curves for each model and look at the subsequently calculated Area Under the Curve for each.

## Creating the Final Database

The provisional database worked well with our selected classification model(s). Based on the resulting output from the model and additional research, we began putting together the next iteration of the database to hopefully improve on the model's performance. After ERT process was complete, our final database contains 73,262 rows and 69 columns. The steps taken included:

1. Keeping steps 2, 3, and 4 from our provisional database work - maintaining these steps still made sense for our final model.

2. Dropping patient height and weight measurements - because the dataset includes a calculated body mass index (bmi) score we decided to remove the two factors that contribute to that score.

3. Dropping calculated scores for APACHE II, III, and IV - the Acute Physiology and Chronic Health Evaluation (APACHE) tool is used in hospital intensive care settings to predict the recuperation and mortality of patients and to classify them. The tool has been modified over the decades since the creation of the original version in 1981 and APACHE II in 1985, with various additions resulting in APACHE III (1991) and APACHE IV (2006). Since our dataset contained all of the factors that contribute to a patient's APACHE score, as well as the score itself, we needed to drop one. It was decided to eliminate the scores themselves and retain the factors (various vitals and labs) to maintain a high number of inputs.

4. Dropping unique identifiers - finally, we made the decision to remove each patient's unique identifiers (patient ID and encounter ID) to hopefully improve the algorithm's performance. A search of resources online indicated that this was typically a best practice (although certainly not unilaterally agreed upon)

#### ERDs

![Picture3](https://user-images.githubusercontent.com/101427781/200974211-bae52751-fde6-4d09-b110-8b56ffd50072.png)


![Picture4](https://user-images.githubusercontent.com/101427781/200974229-31655754-8e38-42c2-8357-3817614bb649.png)


![Picture5](https://user-images.githubusercontent.com/101427781/200974239-76cf148a-dd7b-426d-a49e-8ebd67e0ff7c.png)

## Creating Categorical Datasets

In addition to our final, complete database we wanted to create smaller datasets built around categories of patient information. The accuracy of our primary model was encouraging and we were curious if we could achieve a similar performance when using smaller amounts of more homogeneous data. To explore this possibility, we created the following categorical datasets:

Demographic: includes basic patient information such as age, gender, ethnicity, ICU type, etc.
APACHE covariates: list of factors that contribute to the APACHE scores
APACHE comorbidities: multiple illness diagnoses
All vitals: all of the vitals taken on the patient such as heart rate, respiratory rate, blood pressure, etc.
First HOUR vitals: all of the vitals taken on the patient in the first hour of their ICU stay
First DAY vitals: all of the vitals taken on the patient in the first day of their ICU stay

# Machine Learning

## Preliminary Data PreProcessing

*All datasets had 73,262 rows. The number of columns varied and are displayed below. Patient Vitals in the 1st hour in ICU (12 columns) Patient Vitals in the 1st day in ICU (20 columns) All Patient Vitals (32 columns) Patient Demographics (11 columns) Patient Database (65 columns) APACHE Covariates for each Patient (12 columns) APACHE Comorbidities for each Patient (10 Columns)

*The Database member of our group preprocessed most of our data.

The data preprocessing that the Machine Learning part of our project is listed below:

The unique identifiers were removed from each dataset ('patient_id', 'encounter_id', 'hospital_id'). There was no information in our dataset about where these hospitals were located, we were only given hospital_ids, for this reason we dropped this column. The patient_id and enocounter_id were also dropped because they did not add anything to our analysis.

We had to convert Boolean and float data types to integers with Pandas.

After running all 7 datasets through our model, we found that the dataset with the highest accuracy for our model that we used for the final portion of our project was the database_patient dataset, which included the most columns.

## Preliminary Feature Engineering and Selection

The feature for every model was the same, hospital_death. We wanted to test for a binary outcome, and in our model 0=Survival and 1=Death

## Training and Testing Data

We used the sklearn train_test_split function for all of our datasets.

We also would check the balance for the y_train and y_test data

![Train_Test](https://user-images.githubusercontent.com/101427781/200974653-496c0855-bdae-4335-a0a0-8afbad588a66.png)

## Model Choice

### Balanced Random Forest Classifier

In the mock-up machine learning model we compared the Easy Ensemble Classification Model with the Balanced Random Forest Classifier Model, and ultimately went with BRFC because it had the highest accuracy score.

![model_choice](https://user-images.githubusercontent.com/101427781/200974838-78d0832f-ff45-4974-87dd-fd08fe01f158.png)

Benefits: Robust against overfitting and outliers Ranks importance of input variables in a natural way Can handle thousands of input variables Runs efficiently on large datasets High accuracy and interpretability

Limitations: The algorithm is slower than other classification models

### Choosing the Best Balanced Random Forest Classifier Model

To obtain the best accuracy score for our mdoel, we tested differing n_estimators to see which number would give us the best result.

![BRFC_n_estimators](https://user-images.githubusercontent.com/101427781/200975026-cad699d6-17c1-425f-87d4-8d408e2f3c51.png)

After collecting the results, our team decided to use n_estimators = 5000 for our final machine learning model. The accuracy score is the highest, however, beacuse of the high number of trees needed to run our model, it does take a long time for the code to run.

![Accuracy_score](https://user-images.githubusercontent.com/101427781/200975078-a875553a-b458-4a62-a95e-beea966ef49a.png)

### Confusion Matrix

The confusion matrix illustrates how many of a classifier’s predictions were correct. In the confusion matrix below you can see that our model has the potential to be trained more accurately.

![cm](https://user-images.githubusercontent.com/101427781/200975155-a165aa0c-f623-477b-ad99-28f8d9743191.png)

### Imbalanced Classification Report

![imbalanced_Classification](https://user-images.githubusercontent.com/101427781/200422806-fdebfb95-a0e8-4231-af79-aff2757c38b2.png)

## Questions That Were Answered 

### How accurate can we get a machine learning model with dataset?

![Accuracy_score](https://user-images.githubusercontent.com/101427781/200972902-2eff6081-34cc-4e3b-aba9-6808fac2b849.png)

 ### Top ten features of the data for ICU survivability?
 
 ![Features](https://user-images.githubusercontent.com/101427781/200972991-d13dcb58-cbe7-44b0-833a-0a87230ff211.png)

  ### Can our model predict outcomes as well if not better then the Apache Scores?
  
  
  <img width="312" alt="Picture1" src="https://user-images.githubusercontent.com/101427781/200973545-2f551a21-c943-4b68-945a-f61f831f0857.png">

  
  <img width="468" alt="Picture2" src="https://user-images.githubusercontent.com/101427781/200973567-03a615bb-f9c8-4609-872a-11216a6c011f.png">

  
  
  
