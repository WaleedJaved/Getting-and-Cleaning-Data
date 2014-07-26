# Importing the training data
train_data <- read.table("UCI HAR Dataset/train/X_train.txt")
test_data <- read.table("UCI HAR Dataset/test/X_test.txt")
merged_data <- rbind(train_data,test_data)
columns <- c(1:6,41:46,81:86,121:126,161:166,201,202,214,215,227,228,240,241,253,254,266:271,345:350,424:429,503,504,516,517,529,530,542,543)
extract <- merged_data[,columns]
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
total_ys <- rbind(y_train,y_test)

labels <- read.table("UCI HAR Dataset/activity_labels.txt")
for (i in seq(nrow(total_ys))) {
  number <- total_ys[i,1]
  label <- labels[labels[,1]==number,2]
  total_ys[i,1] <- as.character(label) }

y_merged <- cbind(total_ys,extract)
features <- read.table("UCI HAR Dataset/features.txt")
variables <- vector()
for (i in seq(ncol(extract))){
  feature <- features[columns[i],2]
  variables <- cbind(variables,as.character(feature))}

 variables <- cbind("Activity",variables)
described <- setNames(data.frame(y_merged),c(variables))

# Merging the subject identifier with the data set "described"
subjects_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
subjects_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
all_subjects <- rbind(subjects_train,subjects_test)
variables <- cbind("Subject",variables)
described <- setNames(data.frame(all_subjects,described),c(variables))

library(reshape2)
melted <- melt(described,id=c("Subject","Activity"),measure.vars=c(3:68))
print(second_dataset <- dcast(melted,Subject + Activity ~ variable,mean))

