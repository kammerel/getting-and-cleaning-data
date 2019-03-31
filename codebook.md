Codebook
------------------

## Directories

*main_wd is the main directory where all data is
*test_wd is the path to the test data
*train_wd is the path to the train data

## Test data

*X_test is the test set imported as table, column names are changed with the features list

*features is the list of all features imported as table, feature names column is converted to character

*y_test are activity IDs imported as table, the column is renamed to activity

*subject_test is the list of participant IDs, column name is renamed to ID

*test is a data frame which binds the test set, the activity IDs and the participant IDs 

## Train data

*X_train is the training set imported as table, column names are changed with the features list

*y_train are activity IDs imported as table, the column is renamed to activity

*subject_train is the list of participant IDs, column name is renamed to ID

*train is a data frame which binds the test set, the activity IDs and the participant IDs 

## Merged data

*data is the merged test and train data
  * data is subsetted to the columns activity, ID, mean_names and std_names
  * column activity is indexed by activity lables, renaming all IDs with labels

*activity_labels are the labels for the activity IDs

*mean_names is a character vector with all column names which contain the word "mean"

*std_names is a character vector with all column names which contain the word "std" (standard deviation)

## Clean data

*by_ID_act is data grouped by ID and activity

*res is the resulting data summarized by the mean and withough NAs. Column names in res are changed
  * all "-" are replaced by "."
  * all "t" are replaced by "time"
  * all "f" are replaced by "freq"
  * all "()" are removed
  * all "," are replaced by "."

* further modification of column names is not recommendend as 
  * writing out the full parts would increase the length of the column names too extensively
  * splitting column names further and melting can lead to missing values



