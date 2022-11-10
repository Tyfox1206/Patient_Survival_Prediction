# Patient_Survival_Prediction

## Concept

For our Dashboard we will be using tableau public. This is where we will create our interactive dashboard. For our Interactive Dashboard we will be creating toggle switch that when transitioned between survived and passed different pie charts will be populated to show different parameters. For example, showing the demographics of those individuals, if the user had a comorbidities, max heart rates, and others as we review the dashboard that we feel provides good value and information. Please see next slide for a rough graphic representation of what we are looking to achieve for the interactive element.  

## First Iteration

For the first iteration I attempted to make a toggle button that would display different visualizations on the dashboard. While this feature worked it did not work the way I had hoped and instead we scrapped the idea and went with a more conventional tool tip as our interative element. we also decided to have three dashboard tabs. one for demographics, the top 10 features of the machine learning model and the ROC curve for the tird.

## Second Iteration

### First Dashboard Demographics

I completed the demographics dashbaord which includes:

* Count of Patients
* Ethnicity Breakdown
* Number of Male and Female Patients by Age
* Hospital Stays With Outcomes
* Gender Breakdown
* ICU Admit Reason

Over all this dashboard shows a good breakdown of the patients demographics before getting into the details of the machine learning and ROC Curve comparison.

### Second Dashboard Top 10 Features

I have completed the Second Dashboard which includes:

* Non Ventilated Vs Ventilated Visual
* Glasgow Coma Scale Visual
* 24 Hour Max Heartrate Visual
* Patient Age Visual
* 24 Hour Min Oxygen Saturation Visual
* 24 Hour min Mean Blood Pressure Visual
* 24 Hour Min Systolic Blood Pressure Visual

All these visualizations have the hostipal outcome conversion in them so you can where how they had impacted the number of deaths. For example in the Patient Age visualization as the age increase you can see the increased number of deaths. Whereas in the Min Mean Blood Pressure and Min Systolic Blood Pressure visualization as the number get lower the deaths increase.