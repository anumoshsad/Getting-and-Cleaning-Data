feats <- read.table("UCI HAR Dataset/features.txt")
s <- read.table("UCI HAR Dataset/test/subject_test.txt")
y <- read.table("UCI HAR Dataset/test/Y_test.txt")
x <- read.table("UCI HAR Dataset/test/X_test.txt")
names(s) <- "subjects"; names(y) <- "activities"; 
names(x) <- as.character(feats$V2)
test <- data.frame(s,y,x)

s <- read.table("UCI HAR Dataset/train/subject_train.txt")
y <- read.table("UCI HAR Dataset/train/Y_train.txt")
x <- read.table("UCI HAR Dataset/train/X_train.txt")
names(s) <- "subjects"; names(y) <- "activities"; 
names(x) <- as.character(feats$V2)
train <- data.frame(s,y,x)

total <- rbind(test, train)
vec <- grepl("mean()",names(total)[3:563])|grepl("std()",names(total)[3:563])

MS <- total[,c(TRUE, TRUE, vec)]
MS$activities <- as.factor(MS$activities)
act_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
levels(MS$activities) <- c("WK", "WK_UP", "WK_DW", "SIT", "STND","LAY")
ANSWER <- aggregate(MS[,3:81], list(subjects = MS$subjects, activities = MS$activities), mean)
write.table(ANSWER, "answer.txt", row.names = FALSE)
