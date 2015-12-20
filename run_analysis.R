# Read the names of features
feats <- read.table("UCI HAR Dataset/features.txt")

# Make test data frame with column names from features
s <- read.table("UCI HAR Dataset/test/subject_test.txt")
y <- read.table("UCI HAR Dataset/test/Y_test.txt")
x <- read.table("UCI HAR Dataset/test/X_test.txt")
names(s) <- "subjects"; names(y) <- "activities"; 
names(x) <- as.character(feats$V2)
test <- data.frame(s,y,x)

# Make train data frame with column names from features
s <- read.table("UCI HAR Dataset/train/subject_train.txt")
y <- read.table("UCI HAR Dataset/train/Y_train.txt")
x <- read.table("UCI HAR Dataset/train/X_train.txt")
names(s) <- "subjects"; names(y) <- "activities"; 
names(x) <- as.character(feats$V2)
train <- data.frame(s,y,x)

# add the two data frames to one
total <- rbind(test, train)
# make a logical vector to extract mean and std
vec <- grepl("mean()",names(total)[3:563])|grepl("std()",names(total)[3:563])

# new data frame MS with mean/std info
MS <- total[,c(TRUE, TRUE, vec)]

# write activities names
MS$activities <- as.factor(MS$activities)
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
levels(MS$activities) <- c("WK", "WK_UP", "WK_DW", "SIT", "STND","LAY")

# find the averages of mean and std (there are 79 columns other than subjects and activities)
ANSWER <- aggregate(MS[,3:81], list(subjects = MS$subjects, activities = MS$activities), mean)
names(ANSWER)[3:81] <- paste(rep("col", 79), 3:81)

write.table(ANSWER, "answer.txt", row.names = FALSE)
