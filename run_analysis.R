###################Set and Get Directory
#getwd()
#setwd("~Desktop\\Big_Data\\DataSpec\\Getting_Cleaning_Data\\UCI_HAR_Dataset")
###################Load Packages and Libraries if needed

#install.packages('plyr')
#install.packages('Hmisc')
 install.packages('reshape2')
#library(plyr)
#library(Hmisc)
 library(reshape2)

###################File and Directory Creation

#list.files()
#if(!file.exists("data")) {
  #dir.create("data")
#}

###################Read Data into R

Subject.idTest     <- read.table("./test/subject_test.txt") #From README.txt in getwd()
TestSet            <- read.table("./test/X_test.txt")
TestLabels         <- read.table("./test/y_test.txt")

Subject.idTrain    <- read.table("./train/subject_train.txt")
TrainSet           <- read.table("./train/X_train.txt")
TrainLabels        <- read.table("./train/y_train.txt")

###################Merge the training and the test sets to create one file

DataSet            <- rbind(TestSet,TrainSet)

###################Extracts the mean and standard deviation measurements 

features.txt <- read.table("./features.txt")
colnames(features.txt)<-c("FeatureNumber","FeatureFreqDomainSig")
        
        x   <- features.txt$FeatureFreqDomainSig
meanIndex   <- grep("mean\\(\\)",x,value=F)
stdIndex    <- grep("std\\(\\)" ,x,value=F)
idx         <- sort(c(meanIndex,stdIndex))
DataSet     <- DataSet[,idx]

colnames(DataSet) <-gsub("mean","MeanValues",  x[idx])
      MeanUpdate  <-colnames(DataSet)
colnames(DataSet) <-gsub("std","StdValues",MeanUpdate)
      StdUpdate   <-colnames(DataSet)
colnames(DataSet) <-gsub("\\(\\)",""       ,StdUpdate)
      ColmUpdate  <-colnames(DataSet)
colnames(DataSet) <-gsub("-","."          ,ColmUpdate)

###################Names the activities in the data set

DataLabels           <- rbind(TestLabels,TrainLabels)
activityLabels       <- read.table("./activity_labels.txt")
names(activityLabels)<- c("activityID","actvityDescption")
ActvityDes           <- gsub("_","",activityLabels$actvityDescption)
ActivityLabs         <- ActvityDes[DataLabels[,1]]

###################Label data set with descriptive activity names

Subject.ID        <-  rbind(Subject.idTest,Subject.idTrain)
names(Subject.ID) <- "Subject.ID" 
NewDataSet        <-  cbind(Subject.ID,ActivityLabs,DataSet)
Check             <-  NewDataSet[1:30,1:6]

###################Write Data into Table or CSV file (1)

write.csv(NewDataSet,"SmartPhoneTidyData.csv")
write.table(NewDataSet,"SmartPhoneTidyData.txt",sep= " ")

###################Independent tidy data set with the averages 
###################of each variable for each activity and each subject.

meltedNewData  <-melt(NewDataSet,id=c("Subject.ID","ActivityLabs"),na.rm=T)
NewData2       <-dcast(meltedNewdata ,Subject.ID + ActivityLabs ~ variable,mean)
Check2         <- NewData2[1:30,1:6]

###################Write Data into Table or CSV file (2)

write.csv(NewData2   ,"SmartPhoneTidyData_Means.csv")
write.table(NewData2 ,"SmartPhoneTidyData_Means.txt",sep= " ")