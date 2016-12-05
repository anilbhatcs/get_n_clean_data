library(plyr)
library(reshape2)

#Define constants
file_path_main = "C:/Users/anbhat/Documents/Anil/Cleaning Data/UCI HAR Dataset/"
file_path_test = "test/"
file_path_train = "train/"

#Read the code files
features <- read.table(paste(file_path_main, "features.txt", sep = ""))
activities <- read.table(paste(file_path_main, "activity_labels.txt", sep = ""))
colnames(activities) <- c("activity_id", "activity")

#Read the test dataset; name the measures column variables using the features dataset
x_test <- read.table(paste(file_path_main, file_path_test, "x_test.txt", sep = ""))
names(x_test) <- features[,2]
y_test <- read.table(paste(file_path_main, file_path_test, "y_test.txt", sep = ""))
subject_test <- read.table(paste(file_path_main, file_path_test, "subject_test.txt", sep = ""))
test_data <- cbind(subject_test, y_test, x_test[, grep("(mean|std)\\(\\)", colnames(x_test))])

#Read the training dataset; name the measures column variables using the features dataset
x_train <- read.table(paste(file_path_main, file_path_train, "x_train.txt", sep = ""))
names(x_train) <- features[,2]
y_train <- read.table(paste(file_path_main, file_path_train, "y_train.txt", sep = ""))
subject_train <- read.table(paste(file_path_main, file_path_train, "subject_train.txt", sep = ""))
train_data <- cbind(subject_train, y_train, x_train[, grep("(mean|std)\\(\\)", colnames(x_train))])

#Merge the test and training data sets, and label the Subject and Activity ID columns
merged_data <- rbind(test_data, train_data)
colnames(merged_data)[1] <- "subject"
colnames(merged_data)[2] <- "activity_id"

#Get the Activity Label for each observation
merged_data <- join(merged_data, activities, by = "activity_id")

#Reshape the merged data such that the columns with measures are melted down to rows
#Exclude the Activity ID; we just need the activity names
act_melt <- melt(merged_data, id = c("subject", "activity"), 
                              measure.vars = grep("mean|std", colnames(merged_data)))

#Create the tidy data set by averaging the measures, and output to a text file
tidy_data <- dcast(act_melt, subject + activity ~ variable, mean)
tidy_col <- colnames(tidy_data)
tidy_col <- gsub("^t","Time", tidy_col)
tidy_col <- gsub("^f","Frequency", tidy_col)
tidy_col <- gsub("Acc", "Acceleration", tidy_col)
tidy_col <- gsub("Mag", "Magnitude", tidy_col)
tidy_col <- gsub("BodyBody", "Body", tidy_col)

write.table(tidy_data, file = paste(file_path_main, "activity_averages.txt", sep = ""), row.names = FALSE,
            col.names = tidy_col)
