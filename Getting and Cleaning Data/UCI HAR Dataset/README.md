#####run_analysis.R performs the following:  
    *   Test and Training data is combined into a single large dataset
    *   Coded row and column labels are replaced with decoded, English labels.
    *   Measurements pertaining to mean and standard deviation are extracted from the original dataset
    *   Multiple samples of the same activity by the same subject are averaged.
    *   The resulting tidy dataset is returned as a data frame
#####To run run_analysis.R:
    *   Download the UCI HAR Dataset, obtainable from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
    *   Change your working directory to the UCI HAR Dataset folder
    *   Move this script into the UCI HAR Dataset folder
    *   Call source("run_analysis.R") in your favorite R console
    *   Call run_analysis() to produce/ return the tidy data set