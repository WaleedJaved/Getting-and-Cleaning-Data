This Codebook explains the variables in the final dataset.

Column 1 is labelled "Subject". It includes numbers from 1-30, referring to the 30 subjects that were part of the experiment.

Column 2 is labelled "Activity" and includes 6 levels: Standing, Walking, Walking_Upstairs, Walking_downstairs, Sitting and Laying.

The rest of the columns are about the features that are mentioned in the original document "features_info.txt". The features were
calculated by performing several calculations on the sensors' output. In the original dataset, the features for X, Y, and Z 
dimensions were calculated and mean() and std() of those values were included in the dataset. I simply took those values and calculated
their averages for each subject and activity.

So in the final dataset called "second_dataset", there is only one row for each subject and activity. For instance, the first row 
contains data about "Laying" for subject "1". This information is contained in the first two columns, as discussed above. The rest of the
columns show averages and the titles of the column refer to the feature for which the average is calculated for the particular subject
and activity. 