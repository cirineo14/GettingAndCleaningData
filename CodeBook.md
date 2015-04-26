## Description of the variables, the data, and the transformations performed

The README.md file lists the steps to follow to run the script run_analysis.R

The original data can be found here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones . The unzipped file contains a README.txt with detailed explanations on the variables.

The code reads in the six text files from the training an test folders. The six data frames are then merged into a single temporary data frame called mergedDF.

The next step is the extraction of subjects data, the activities data, and the measurements on the mean and standard deviation. To do this, the labels from the features.txt file containing the "mean" and "std" strings were selected in the computation of the indices vector to be used for the extraction. This decision was made to leave to the user of the tidy data file the option to use results based on any mean and standard deviation measurement. The tidyDF data frame is created at the end of this step.

At this stage, the second column of the tidyDF corresponds to the activities expressed as numbers. These are converted to factor variables using labels from the activity_labels.txt file from the unzipped folder. All the columns of tidyDF are then labeled with descriptive variable names. The mean and std measurements are labelled using the labels in the features.txt file and the indices vector previously created for the extraction.

The X data frame is created by taking the average of each variable for each activity and each subject from tidyDF. The X data frame is finally written into the "TidyDataSet.txt" file.


## Description of the data frame in the TidyDataSet.txt file

The file can be read in R with the command read.table("TidyDataSet.txt").

The data set has 180 observations of 81 variables. The data is ordered by subject ID and then by activity. Ex.: the fist six lines contains the results by activity (six of them) of the first participant. The variables are the following:

1. "Subject": An integer variable. The subject ID.
2. "Activity": A factor variable. The activity performed while taking the measurement. The activities are "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING".
3. "tBodyAcc-mean()-X": A numerical variable. The first of the 79 mean variables of the measurements based on mean and std.
…	…
81. "fBodyBodyGyroJerkMag-meanFreq()": A numerical variable. The last of the 79 mean variables.
