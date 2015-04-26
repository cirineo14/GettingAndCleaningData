### What the run_analysis.R script does

The script takes data collected from the accelerometers from the Samsung Galaxy S smartphone as an input ([link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)) and produces the file "TidyDataSet.txt" containing a tidy data set that can be used for analysis.

See the CodeBook.md file for explanations on the variables, the data and the work performed to clean up the data.


### Steps to follow to run the script run_analysis.R

NOTE: a version of the dplyr package that includes "summarise_each" must be installed.

1. Save the script in the working directory.
2. Save the "UCI HAR Dataset" folder (from the project data zip file) in the working directory.
3. In the R console, type source("run_analysis.R").
4. The file created can be read in R with the command read.table("TidyDataSet.txt").
