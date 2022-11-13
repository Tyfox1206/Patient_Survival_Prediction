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
 * Can our model predict outcomes as well if not better then the Acute Physiology and Chronic Health Evaluation (APACHE) system ?

## Google Slides
[Here is a link to our slide deck for out project](https://docs.google.com/presentation/d/1tqfkghh-dxVE-MiiTn7kj0nsAiQ8NWGiNQQ4aSdb_-s/edit#slide=id.g13cbd3b1228_0_15)

## Dashboard
*Here will go our link to the Dashboard

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

![database_entity_relationship_diagram_FINAL](https://user-images.githubusercontent.com/101427781/201540251-0d7a03f5-819b-449e-81f5-5e9b5ec62111.png)


![ERD_Process](https://user-images.githubusercontent.com/101427781/201540259-4e682e65-8f23-4887-b915-b76132f2bb49.png)


![Completed_ERD_Slide](https://user-images.githubusercontent.com/101427781/201540266-97b8422f-3f2d-439c-8b6d-576748b1b361.png)


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

We also checked the balance for the y_train and y_test data, and created visualizations to detail the breakdown.

![Train_Test](https://user-images.githubusercontent.com/101427781/200974653-496c0855-bdae-4335-a0a0-8afbad588a66.png)

![Proportion](https://user-images.githubusercontent.com/101427781/201543609-56bb94b8-89b4-4287-8c5e-1e08a6484bb1.png)

![Train_Test_BREAKDOWN](https://user-images.githubusercontent.com/101427781/201543616-2de55a7f-67f9-4dea-a587-c21ffe88b75d.png)


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

 ### Can our model predict outcomes as well if not better then the Acute Physiology and Chronic Health Evaluation (APACHE) system ?
  
 When a patient is admitted to an Intensive Care Unit (ICU), their outcome depends on numerous factors including age, sex, and severity of underlying health condition(s), as well as various physiological and laboratory metrics. In order to more easily measure the severity of disease and provide an estimation of mortality, APACHE was developed to take in a number of related parameters and summarize a patient's outlook with a score (from 0 to 71), with higher scores corresponding to more severe disease and a higher risk of death. Since its initial creation in 1981, the APACHE tool has been updated several times and the most common versions used today by ICUs are APACHE II and APACHE IV. 
  
An APACHE II score is calculated on parameters from three broad categories:

1. Acute Physiology Score (measured within 24 hours of admission)
- Alveolar–arterial gradient (AaDO2) or blood gas tension (PaO2) of oxygen
- Body temperature (rectal)
- Mean arterial pressure
- Blood pH
- Heart rate
- Respiratory rate
- Serum sodium
- Serum potassium
- Creatinine (Double point score for acute renal failure)
- Hematocrit
- White blood cell count
- Glasgow Coma Scale (15 minus actual GCS)

2. Age Points
- Points are assigned to the patient (between 0 and 6), based on their age. The older they are, the more points are given. 

3. Chronic Health Points
- Additional points are assigned if the patient has a history of severe organ system insufficiency, including:
  - Liver cirrhosis
  - Portal hypertension
  - Heart failure 
  - Severe respiratory disease
  - Dialysis dependent 
  - Immunocompromised (i.e. due to chemotherapy, radiation, lymphoma, etc.)

Points are assigned for the above depending on whether the patient is nonoperative, elective postoperative or emergency nonoperative.

***Detail on APACHE IV will go here

***Summary APACHE charts will go here

Discussion about the correlation between APACHE score and predicting mortality rate here...

## Receiver Operating Characteristic (ROC) Analysis

In order to assess the performance of our balanced random forest classifer model next to both the APACHE II and IV predictive models, we needed a technique to directly compare all three. Additionally, the team was interested in a more robust means of comparison than simply looking at the accuracy score of each. A literature review led us to receiver operating characteristic (ROC) analysis, which is widely used when assessing binary classifier models and has been used in past research on APACHE effectiveness. 

The outcome of ROC is a curve that is created by plotting the true positive rate (sensitivity) against the false positive rate (1 - specificity) at various threshold settings. In general, the more the curve hugs of the upper lefthand corner of the chart, the better the model does at classifying the data. In order to make a direct comparision between the models in this project, we calculated the Area Under the Curve (AUC) for each, which tells us how much of the chart area can be found below the curve. The closer the AUC is to 1, the better the model performance. An AUC closer to 0.5 would indicate a model no better than one that randomly classifies.

Looking at the ROC curves below, suggests that all three classifiers (BRFC, APACHE II, APACHE IV) performed well in predicting mortality in our ICU patient dataset. The generated AUC values are especially encouraging, as our BRFC model (AUC = 0.869) outperformed both APACHE II (AUC = 0.825) and APACHE IV (AUC = 0.836).
  
  ![ROC2](https://user-images.githubusercontent.com/101427781/201540369-e64e5f67-1bfb-4c55-985d-2488a07fc2f0.png)

  <img width="400" alt="Picture3" src="https://github.com/Tyfox1206/Patient_Survival_Prediction/blob/main/Database/APACHE%20IV%20ROC.png">
  
  <img width="400" alt="Picture2" src="https://user-images.githubusercontent.com/101427781/200973567-03a615bb-f9c8-4609-872a-11216a6c011f.png">

  
  ### Further Improvements
  
  *We still need to discuss this as a group
  
  ### References
  
1.	VBA function that calculates an APACHE II score for a patient. We used this function to calculate scores for the patients in our dataset.

https://github.com/kevinconroy/apacheII

2.	APACHE II: a severity of disease classification system

https://www.researchgate.net/publication/19234189_APACHE_II_a_severity_of_disease_classification_system

3.	Mortality Prediction Using Acute Physiology and Chronic Health Evaluation II and Acute Physiology and Chronic Health Evaluation IV Scoring Systems: Is There a Difference?

https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5971641/

4.	Comparison of the mortality prediction of different ICU scoring systems (APACHE II and III, SAPS II, and SOFA) in a single-center ICU subpopulation with acute respiratory distress syndrome

https://www.sciencedirect.com/science/article/pii/S042276381530025X

5.	The comparison of apache II and apache IV score to predict mortality in intensive care unit in a tertiary care hospital

https://www.msjonline.org/index.php/ijrms/article/view/6088/4684

6.	Evaluation of mortality prediction using SOFA and APACHE IV tools in trauma and non-trauma patients admitted to the ICU

https://eurjmedres.biomedcentral.com/articles/10.1186/s40001-022-00822-9#Tab1

7.	A study on the efficacy of APACHE-IV for predicting mortality and length of stay in an intensive care unit in Iran

https://www.ncbi.nlm.nih.gov/pmc/articles/PMC5710303/

8.	Validation of the APACHE IV model and its comparison with the APACHE II, SAPS 3, and Korean SAPS 3 models for the prediction of hospital mortality in a Korean surgical intensive care unit

https://www.semanticscholar.org/paper/Validation-of-the-APACHE-IV-model-and-its-with-the-Lee-Shon/992db36eded98951f6d39d9915ec0b20aa3d7dd1

9.	Acute Physiology and Chronic Health Evaluation (APACHE) IV: Hospital mortality assessment for today’s critically ill patients*

http://www.jvsmedicscorner.com/ICU-Miscellaneous_files/APACHE%20IV.pdf
  
10. Informational ROC Curve Image

https://sarvagnasaitech.com/roc-curve-and-its-importance-in-machine-learning/
