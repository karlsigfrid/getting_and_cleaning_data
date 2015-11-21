file_to_df<-function(filename){
  print("executing file_to_df")
  print(paste("reading file ", filename))
  mylines<-readLines(filename)
  print("splitting strings into vectors")
  mylines<-strsplit(mylines, " ")
  print("removing empty strings from vectors")
  for (i in 1:length(mylines)){
    mylines[[i]]<-mylines[[i]][mylines[[i]]!=""]
    if (length(mylines[[i]])!=561) {
      print(paste("warning, not 561 at i= ", i))
    }
  }  
  print("convert list to data frame")
  mydf<-data.frame(do.call(rbind, mylines)) 
return(mydf)
}


makedf<-function(){
  xtest<-file_to_df("X_test.txt")
  xtrain<-file_to_df("X_train.txt")
  print("Combine the two data frames")
  xall<-rbind(xtest, xtrain)
  return(xall)
}


label_rows_columns<-function(mydf){
  print("Adding activity column")
  ytest<-readLines("y_test.txt")
  ytrain<-readLines("y_train.txt")
  ylist<-c(ytest, ytrain)
  mydf<-cbind(ylist, mydf)
  colnames(mydf)[1]<-"Activity"
  
  print("Converting numbers to activity names.")
  actnames<-c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS",
              "SITTING", "STANDING", "LAYING")
  mydf$Activity<-as.character(mydf$Activity)
  for (i in 1:6){
    mydf[mydf$Activity==as.character(i),"Activity"]<-actnames[i]
  }
  
  print("Set column names for all columns except 'Activity'")
  myfeatures<-readLines("features.txt")
  colnames(mydf)[2:length(colnames(mydf))]<-myfeatures
  
  return(mydf)
}

extract_mean_std<-function(mydf){
  print("Extract limited mean_std frame")
  is_mean<-grep("mean()", colnames(mydf))  
  is_std<-grep("std()", colnames(mydf))
  is_either<-c(1,2,3, is_mean, is_std) #add a 1 in the beginning for "Activity"
  is_either<-sort(is_either)
  return(mydf[,is_either])
}

identify_subjects<-function(mydf){
  print("Creating string with values for each person/activity combo")

    subjects<-readLines("subject_test.txt")
    subjects<-c(subjects, readLines("subject_train.txt"))      
    
    mydf<-cbind(subjects, mydf)
    colnames(mydf)[1]<-"Subject"
  
    mydf<-cbind(paste("Subject", mydf$Subject, mydf$Activity),mydf)  
    colnames(mydf)[1]<-"Subject_Activity"
    return(mydf)
}

tidy_colnames<-function(mydf){
  tmp<-colnames(mydf)
  tmp<-sub(".* ", "", tmp)
#  tmp<-sub(".* f", "", tmp)
  tmp<-gsub("-", "", tmp)
  tmp<-sub("\\()", "", tmp)
  tmp<-tolower(tmp)
  colnames(mydf)<-tmp
  return(mydf)
  
}
  
make_numeric<-function(mydf){
  for (i in 1:length(mydf)){
    mydf[,i]<-as.character(mydf[,i])
    mydf[,i]<-as.numeric(mydf[,i])
  }
  return(mydf)
}

group_means<-function(mydf){
  mydf<-mydf[,c(1,4:length(mydf))]
  mygroup<-group_by(mydf, subject_activity)
  mygroupsummary<-mygroup%>%summarize_each(funs(mean))
  mygroupsummary<-mygroupsummary[order(as.numeric(sub(".* (.*) .*", "\\1", mygroupsummary$subject_activity))),]
  return(mygroupsummary)    
}


#To create a new dataset from the text files, run main(). Returns a dataset.
#To get a new table with means per activity and subject, run group_means(x) where x is a dataset from the main-function.

main<-function(){ #If argument myinput is "new", data sets are read from files into a new dataframe.
  library(dplyr)
  mydf<-makedf()
  mydf<-make_numeric(mydf)
  mydf<-label_rows_columns(mydf)
  mydf<-identify_subjects(mydf)
  mydf2<-extract_mean_std(mydf) #Extract limited mean_std frame
  mydf2<-tidy_colnames(mydf2)
  return(mydf2)
  
}