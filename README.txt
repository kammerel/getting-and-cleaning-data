Assignment Summary
------------------

The getting and cleaning course requires a submission of a tidy data set. As the given data consists of several files some preparatory merging and labelling steps have to be done before tyding the data. These steps can be found in the run_analysis.R script and are described in the following.

Run_Analysis.R
--------------

The Run_Analysis.R script contains six sections which fullfil the assigment requirements in a different order. Which step is covered in which section is indicated in the parenthesis of the section title.

## Import and label Test Data (step 1 + 4)  

* The provided data was split into a test and a training set, therefore each data set has to be read into R separately. In this section the test set from the X_test.txt file, as well as the feature names from the features.txt are read into R by setting the main directory "main_wd" and specifying the test directory by "test_wd". The features are classified as character and set as names in the test data set. 

* Furthermore the activities of the observed subjects which can be found in the y_test.txt are read in and renamed to "activity".

* As a last step the IDs of the subjects, which are saved in the subject_test.txt file are read in and named "ID".

* The test set, the activities and the subject IDs are bound into a data frame called "test"


## Import and label Train Data (step 1 + 4) 
* The same procedure as for the test set is conducted for the train set, hereby the main directory has to be set one more time and subsequently the "train_wd" points to the path where the train data is.

* The train set which is saved in the X_train.txt, is read in and named with the already read in feature names

* Activities for the train set are read in from the y_train.txt file and named "activity"

* The subject IDs in the subject_train.txt file are read in and named "ID". 

* The train set, the acitivites and IDs are bound to a data frame called "train"

## Merging of test and train set (step 1) 

* As the test and train data frames have the same headers, the merging of the data is done by binding the rows. 

* The merged data set is called "data"

*Unnecessary data from the previous steps is removed.

## Extraction of mean and standard deviation for each measurement (step 2) 

* The column names of the means and standard deviations are extracted using regular expressions

* After extracting the names the data frame "data" is subsetted using the mean and standard deviation names

## Use descriptive activity names to name activities (step 3)   
  
* The descriptive activity names are read in reading activity_lables.txt file

* The activities in the column "activity" in the merged data frame "data" are translated into the descriptive activity names by using positional indexing 

## Create clean data set and average each variable per person and activity (step 5) 
        


Repository Contents
-------------------
* README containing assignment summary and run_analysis.R description
* run_analysis.R script to run the necessary steps for a clean data set
* Clean data set called tidy_data.txt
* Code book containing all modifications and updates of available codebooks with the data to indicate all the variables and summaries calculated, along with units, and any other relevant information.
