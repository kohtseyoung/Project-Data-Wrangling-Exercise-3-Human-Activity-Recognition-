library(dplyr)
library(tidyr)
library(tibble)
#loading train datasets
subject_train  <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\subject_train.txt",header=FALSE)
x_train <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\x_train.txt",header=FALSE)
y_train <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\y_train.txt",header=FALSE)
body_acc_x_train <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_x_train.txt",header=FALSE)
body_acc_y_train <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_y_train.txt",header=FALSE)
body_acc_z_train <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\body_acc_z_train.txt",header=FALSE)
body_gyro_x_train <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_x_train.txt",header=FALSE)
body_gyro_y_train <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_y_train.txt",header=FALSE)
body_gyro_z_train <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\body_gyro_z_train.txt",header=FALSE)
total_acc_x_train <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_x_train.txt",header=FALSE)
total_acc_y_train <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_y_train.txt",header=FALSE)
total_acc_z_train <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\train\\Inertial Signals\\total_acc_z_train.txt",header=FALSE)

#loading test datasets
subject_test  <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\subject_test.txt",header=FALSE)
x_test <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\x_test.txt",header=FALSE)
y_test <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\y_test.txt",header=FALSE)
body_acc_x_test <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_x_test.txt",header=FALSE)
body_acc_y_test <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_y_test.txt",header=FALSE)
body_acc_z_test <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\Inertial Signals\\body_acc_z_test.txt",header=FALSE)
body_gyro_x_test <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_x_test.txt",header=FALSE)
body_gyro_y_test <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_y_test.txt",header=FALSE)
body_gyro_z_test <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\Inertial Signals\\body_gyro_z_test.txt",header=FALSE)
total_acc_x_test <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_x_test.txt",header=FALSE)
total_acc_y_test <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_y_test.txt",header=FALSE)
total_acc_z_test <-read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\test\\Inertial Signals\\total_acc_z_test.txt",header=FALSE)

#loading activity_label
activity_label <- read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\activity_labels.txt",header=FALSE)

#loading features_label
feature_label <- read.table(file ="C:\\Users\\Tse Young\\Downloads\\getdata%2Fprojectfiles%2FUCI HAR Dataset\\UCI HAR Dataset\\features.txt",header=FALSE)


#Combining train datasets 
labeled_y_train<- left_join(y_train,activity_label)
complete_train <-cbind(subject_train,labeled_y_train,x_train)
names(complete_train)[1] <- "Subject Number"
names(complete_train)[2] <- "Activity Number"
names(complete_train)[3] <- "Activity Name"
names(complete_train)[4:564] <-paste("T&F",1:561,sep="-")

names(body_acc_x_train)[1:128] <-paste("body_acc_x",1:128,sep="-")
names(body_acc_y_train)[1:128] <-paste("body_acc_y",1:128,sep="-")
names(body_acc_z_train)[1:128] <-paste("body_acc_z",1:128,sep="-")
names(body_gyro_x_train)[1:128] <-paste("body_gryo_x",1:128,sep="-")
names(body_gyro_y_train)[1:128] <-paste("body_gryo_y",1:128,sep="-")
names(body_gyro_z_train)[1:128] <-paste("body_gryo_z",1:128,sep="-")
names(total_acc_x_train)[1:128] <-paste("total_acc_x",1:128,sep="-") 
names(total_acc_y_train)[1:128] <-paste("total_acc_y",1:128,sep="-") 
names(total_acc_z_train)[1:128] <-paste("total_acc_z",1:128,sep="-") 

complete_train <-cbind(complete_train,body_acc_x_train,body_acc_y_train,body_acc_z_train,body_gyro_x_train,body_gyro_y_train,body_gyro_z_train,total_acc_x_train,total_acc_y_train,total_acc_z_train)

#Combining test datasets 
labeled_y_test<- left_join(y_test,activity_label)
complete_test <-cbind(subject_test,labeled_y_test,x_test)
names(complete_test)[1] <- "Subject Number"
names(complete_test)[2] <- "Activity Number"
names(complete_test)[3] <- "Activity Name"
names(complete_test)[4:564] <-paste("T&F",1:561,sep="-")

names(body_acc_x_test)[1:128] <-paste("body_acc_x",1:128,sep="-")
names(body_acc_y_test)[1:128] <-paste("body_acc_y",1:128,sep="-")
names(body_acc_z_test)[1:128] <-paste("body_acc_z",1:128,sep="-")
names(body_gyro_x_test)[1:128] <-paste("body_gryo_x",1:128,sep="-")
names(body_gyro_y_test)[1:128] <-paste("body_gryo_y",1:128,sep="-")
names(body_gyro_z_test)[1:128] <-paste("body_gryo_z",1:128,sep="-")
names(total_acc_x_test)[1:128] <-paste("total_acc_x",1:128,sep="-") 
names(total_acc_y_test)[1:128] <-paste("total_acc_y",1:128,sep="-") 
names(total_acc_z_test)[1:128] <-paste("total_acc_z",1:128,sep="-") 

complete_test <-cbind(complete_test,body_acc_x_test,body_acc_y_test,body_acc_z_test,body_gyro_x_test,body_gyro_y_test,body_gyro_z_test,total_acc_x_test,total_acc_y_test,total_acc_z_test)

#combining complete test and test data & relabelling TF
all_data <- rbind(complete_train,complete_test)
TF_labelling <- feature_label$V2
names(all_data)[4:564] <- paste(TF_labelling)
str(all_data)

#obtaining mean and std of measurements from all_data and create into columns
col_mean_std <- colnames(all_data)[grepl(".mean|.std",colnames(all_data))]
mean_std_all_data<- all_data[col_mean_std]
labelled_mean_std_all_data <- cbind(all_data[1:3],mean_std_all_data)
labelled_mean_std_all_data <- labelled_mean_std_all_data %>%gather("Measurements","Values",colnames(labelled_mean_std_all_data)[4:82])

#filter only "mean" from labelled_mean_std_all_data
labelled_mean_all_data<- labelled_mean_std_all_data %>% filter(grepl("mean",labelled_mean_std_all_data$Measurements))
str(labelled_mean_all_data)

#convert
write.csv(labelled_mean_all_data,file="C:\\Users\\Tse Young\\Desktop\\Data Science research\\Playground\\Assignment\\Data Wrag3\\samsung_clean.csv")
write.table(labelled_mean_all_data,file="C:\\Users\\Tse Young\\Desktop\\Data Science research\\Playground\\Assignment\\Data Wrag3\\samsung_clean.txt")
