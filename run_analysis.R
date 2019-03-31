# Assignment Getting and Cleaning Data
#
# You should create one R script called run_analysis.R that does the following.
#
# 1. Merges the training and the test sets to create one data set. 
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set 
# 4. Appropriately labels the data set with descriptive variable names. 
# 5. From the data set in step 4, creates a second, independent tidy data set
# with the average of each variable for each activity and each subject.

# All above steps are covered in a different order

# Import and label Test Data (step 1 + 4)  ---------------------------------------------------------------

        # Setting the working directory for test folder and reading in test data

        main_wd <- getwd()
        test_wd <- paste(getwd(), "/","getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/test/", sep ="")
        setwd(test_wd)
        X_test <- read.table("X_test.txt")
        
        # Read in the feature names, convert to character and name the columns of test
        # set according to feature names
        features <- read.table("../features.txt")
        features <- as.character(features$V2)
        names(X_test) <- features
        
        # Read in test labels and name the column activity
        y_test <- read.table("y_test.txt")
        names(y_test) <- "activity"
        
        # Read in subject IDs for test set and name the column ID
        subject_test <- read.table("subject_test.txt")
        names(subject_test)<- "ID"
        
        # Bind the columns of test set, test labels and subject IDs to a data frame
        test <- as.data.frame(cbind(X_test, y_test, subject_test))

# Import and label Train Data (step 1 + 4) --------------------------------------------------------------

        # Setting the working directory for train folder and reading in train data
        setwd(main_wd)
        train_wd <- paste(getwd(), "/","getdata_projectfiles_UCI HAR Dataset/UCI HAR Dataset/train/", sep = "")
        setwd(train_wd)
        X_train <- read.table("X_train.txt")
        
        # name the columns of train set according to feature names
        names(X_train) <- features
        
        # Read in train labels and name the column activity
        y_train <- read.table("y_train.txt")
        names(y_train) <- "activity"
        
        # Read in subject IDs for train set and name the column ID
        subject_train <- read.table("subject_train.txt")
        names(subject_train) <- "ID"
        
        # Bind the columns of train set, train labels and subject IDs to a data.frame
        train <- as.data.frame(cbind(X_train, y_train, subject_train))


# Merging of test and train set (step 1) -------------------------------------------

        # Bind the test and train set and remove unnecessary tables
        data <- rbind.data.frame(test, train)
        rm(X_test, X_train, y_test, y_train, test, train, subject_test, subject_train)
        

# Extraction of mean and standard deviation for each measurement (step 2) ----------

        # Extract mean and standard deviation by using regular expression within grep
        # function
        mean_names <- grep("[Mm]ean", names(data), value = T)
        std_names <- grep("std", names(data), value = T)
        
        # Subset by using the names
        data <- data[ ,c(mean_names, std_names, "activity", "ID"), ]
        
# Use descriptive activity names to name activities (step 3) --------

        # Read in activity labels and take activity labels as positional index for
        # renaming the activties
        
        activity_labels <- read.table("../activity_labels.txt")
        data$activity<- activity_labels$V2[data$activity]
        
        

# Create clean data set and average each variable per person and activity (step 5) --------

        # Group by ID, by activity and summarise by taking the mean of all variables
        library(dplyr)
        by_ID_act <- data %>% group_by(ID, activity)
        
        res <- by_ID_act %>% summarise_all(mean, ra.rm = TRUE)
        
        # Clean column names
       
        
        colnames(res) <- gsub(pattern = "-", replacement = ".", x = colnames(res))
        
        colnames(res) <- gsub(pattern = "^t", replacement = "time", x = colnames(res))
        
        colnames(res) <- gsub(pattern = "^f", replacement = "freq", x = colnames(res))
        
        colnames(res) <- gsub(pattern = "[()]", replacement = "", x = colnames(res))
        
        colnames(res) <- gsub(pattern = ",", replacement = ".", x = colnames(res))

        # write.table(res, "E:/Dokumente/Fortbildung on the job/Coursera/Data Science Specialization/Course 3 Getting and Cleaning Data/Assignment/Submission/tidy_data.txt", row.names = F)
        

        