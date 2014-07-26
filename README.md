
==================================================================
This README file explains the "run_analysis.r" script. 
==================================================================

The script will work as long as you have "UCI HAR Dataset" in your working directory. Below is a description of
what each line of the code does to arrive at the final output.

Line 2: Imports the training dataset and names it "train_data"
Line 3: Imports the test dataset and names it "test_data"
Line 4: Adds the "test_data" to the bottom of the "train_data" and produces a combined dataset called "merged_data"
Line 5: Creates a vector of the column numbers that have mean and std measurements in the "merged_data" and calls
        it "columns". These column numbers were obtained by observing the "features.txt" file in a notepad.
Line 6: Extracts the desired columns from the "merged_data" and names it "extract". So "extract" dataset contains
	mean and std measurements only.
Line 7 & 8: Import the activity labels for the training and testing datasets.
Line 9: Combines the activity labels just the way the training data and testing data were combined and names it "total_ys".
Line 11-15: First, the "activity_labels" file is imported. Then, a loop runs through the rows of "total_ys", extracts the 
		label number, then goes to "activity_labels" and extracts the corresponding label name (e.g. Standing)
		and then replaces the number with the label in the file "total_ys". 
Line 17: It now adds the "total_ys" to the right of "extract" and names it "y_merged". So this is a dataset with the 
	activity labels in its first column. 
Lines 18-22: These run a loop where the "columns" vector is used to go through the "features.txt" file and extract the 
		names of the features that are mean and std measurements. A new vector is created called "variables" which
		consists these names.
Line 24: It adds "Activity" as an item to the "variables" vector.
Line 25: It creates a data frame using the data from "y_merged" and uses "variables" to name the columns. Data frame is
	called "described". 

Lines 28-30: These import the subject identifiers from the train and test data and combine them, just the way the activity
		identifiers were imported and combined. 
Lines 31-32: "Subject" is added to "variables" and now a new data frame called "described" is created again but this data frame
		includes "Subjects" as its first column. 
Lines 34-36: The "reshape2" library is imported and used first to melt the dataset "described" and then use dcast function
		to list the data with subject and activity, and calculate a mean on all variables corresponding to that combination
		of subject and activity. For instance, the first row shows the means of ALL variables in separate columns for "laying" by subject "1".
		The dataset is printed in the Console.  