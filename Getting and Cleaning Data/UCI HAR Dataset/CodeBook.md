Feature Selection 
=================

###Descrption
        The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

        Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

        Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

###Signals
#####These signals were used to estimate variables of the feature vector for each pattern:  
    '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

    *   tBodyAcc-XYZ
    *   tGravityAcc-XYZ
    *   tBodyAccJerk-XYZ
    *   tBodyGyro-XYZ
    *   tBodyGyroJerk-XYZ
    *   tBodyAccMag
    *   tGravityAccMag
    *   tBodyAccJerkMag
    *   tBodyGyroMag
    *   tBodyGyroJerkMag
    *   fBodyAcc-XYZ
    *   fBodyAccJerk-XYZ
    *   fBodyGyro-XYZ
    *   fBodyAccMag
    *   fBodyAccJerkMag
    *   fBodyGyroMag
    *   fBodyGyroJerkMag

#####The set of variables that are retained from the original signals are: 

    *   mean(): Mean value
    *   std(): Standard deviation

#####Additional vectors obtained by averaging the signals in a signal window sample. These are used on the original angle() variable:

    *   gravityMean
    *   tBodyAccMean
    *   tBodyAccJerkMean
    *   tBodyGyroMean
    *   tBodyGyroJerkMean

#####This data set, named tidy_data, is produced using run_analysis.R in the UCI HAR Dataset directory

###Analysis
#####run_analysis.R performs the following:   
    *   Test and Training data is combined into a single large dataset
    *   Coded row and column labels are replaced with decoded, English labels.
    *   Measurements pertaining to mean and standard deviation are extracted from the original dataset
    *   Multiple samples of the same activity by the same subject are averaged.
    *   The resulting tidy dataset is returned as a data frame
