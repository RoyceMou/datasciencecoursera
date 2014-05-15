#This program produces a tidy data set from the UCI HAR Dataset which can be found at:
#         http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
#   Test and Training data is combined into a single large dataset
#   Coded row and column labels are replaced with decoded, English labels.
#   Measurements pertaining to mean and standard deviation are extracted from the original dataset
#   Multiple samples of the same activity by the same subject are averaged.
#   The resulting tidy dataset is returned as a data frame

run_analysis <- function(){
    #Check that UCI HAR Dataset is the working directory 
    if (identical(grep("UCI HAR Dataset$", getwd()), integer(0))){
        print("UCI HAR Dataset is not your working directory.")
        print("Please set your working directory to UCI HAR Dataset using setwd()")
        return()
    }
    
    print("As the datasets are large, the program may take a few seconds to run...")
    
    #Load data
    subj_test <- read.table("test/subject_test.txt")    #Subject 
    x_test <- read.table("test/X_test.txt")             #Set
    y_test <- read.table("test/Y_test.txt")             #Labels
    subj_train <- read.table("train/subject_train.txt") 
    x_train <- read.table("train/X_train.txt")
    y_train <- read.table("train/Y_train.txt")
    activity_labels <- read.table("activity_labels.txt")
    features <- read.table("features.txt")
    
    #1. Merges the training and the test sets to create one data set.
    test <- cbind("Subject" = subj_test$V1, "Labels" = y_test$V1, x_test)
    train <- cbind("Subject" = subj_train$V1, "Labels" = y_train$V1, x_train)
    data <- rbind(test, train)
    
    #2. See below
        
    #3. Uses descriptive activity names to name the activities in the data set
    data$Labels <- activity_labels$V2[data$Labels]      #Replace row labels
    
    #4. Appropriately labels the data set with descriptive activity names. 
    names(data) <- c("Subject", "Labels", as.character(features$V2))   #Replace column labels
    
    #2. Extracts only the measurements on the mean and standard deviation for each measurement. 
    data <- data[, c(1, 2, grep("[Mm]ean|[Ss]td", names(data)))]
    
    #5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
    names <- names(data)                                                                #Stores names for later usage
    data <- split(data, list(data$Subject, data$Labels))                                #Split data by subject and label
    numeric_data <- lapply(lapply(data, "[", -(1:2)), colSums)                          #Take the column sums of numeric data
    SL <- data.frame(matrix(unlist(strsplit(names(data),"\\.")), nrow=180, byrow=T))    #Obtain Subject and Label vectors
    tidy_data <- data.frame(SL, matrix(unlist(numeric_data), nrow=180, byrow=T))        #Create the tidy data set
    names(tidy_data) <- names                                                           #Label the tidy data set
    #Note: this sequence can be improved; it is inefficient and ugly due to unfamiliarity with R
    
    #Write data to file
    write.table(tidy_data, file = "tidy_data.txt")
    print("This program produces a file named tidy_data.txt in your current directory.")
    invisible(tidy_data)    
}