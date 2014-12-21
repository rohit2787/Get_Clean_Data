url<-"http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip"
download.file(url,"Samsung data.zip")
unzip("./Samsung data.zip")


#Main Folder
list.files()
act_label<-read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE)
names(act_label)<-c("Activity-Label","Activity")
features<-read.table("./UCI HAR Dataset/features.txt",header=FALSE)
nam<-as.vector(unlist(unname(features[,2])))
n_req1<-as.numeric(grepl("mean",nam,ignore.case=TRUE))
n_req2<-as.numeric(grepl("std",nam,ignore.case=TRUE))
n_req<-as.logical(n_req1+n_req2)
names(features)<-c("Sr.No.","Variable")



#Test Set
list.files("./UCI HAR Dataset/test")
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)
names(X_test)<-nam
X_test<-X_test[,n_req]
Subject_test<-read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)
names(Subject_test)<-"Subject"
Activity_test<-read.table("./UCI HAR Dataset/test/y_test.txt",header=FALSE)
names(Activity_test)<-"Label"
test_set<-cbind(Subject_test,Activity_test,X_test)


#Train Set
list.files("./UCI HAR Dataset/train")
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)
names(X_train)<-nam
X_train<-X_train[,n_req]
Subject_train<-read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)
names(Subject_train)<-"Subject"
Activity_train<-read.table("./UCI HAR Dataset/train/y_train.txt",header=FALSE)
names(Activity_train)<-"Label"
train_set<-cbind(Subject_train,Activity_train,X_train)
data_set<-rbind(test_set,train_set)
data_set$Label<-factor(data_set$Label,levels=act_label$Label,labels=act_label$Activity)

#Post Processing
library("reshape")
a<- melt(data_set, id=c("Subject","Label"))
sub_mean<-cast(a, Subject+Label~variable, mean)
write.table(sub_mean,file="run_analysis.txt",row.name=FALSE)
