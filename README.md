## Data Science Specialization - Coursera: Getting and Cleaning Data Project


The following offers a operational description of run_analysis.R.

Assuming that run_analysis.R is being executed in the working directory
where the data zipfile has been unzipped:
  
         
-  First the script double checks the current directory getwd () and 
   allows for the setting of the proper directory if necessary setwd()      	

-  Second the script loads packages and libraries that are assumed
   common for data scrubbing tasks

-  Third the script reads in the text files using read.table() from the the working
   directory (e.g../test/y_test.txt")
 
-  Fourth the script combines the rows from the Testset and Trainset
   that where read in from the text files in the working directory.

-  Fifth the script reads in the feature.txt data,reorginizes,cleans
   and renames DataSet colnames.
 
-  Sixth the rows from TestLabels and Trainlabels are combined  
   using rbind() and activity labels are read into R. 

-  Seventh the rows from Subject.idTest and Subject.idTrain are combined
   using rbind(),given a name and stored in Subject.ID.
		
-  Eigth Subject.ID,ActivityLabels and Dataset are intergrated by column using 
   cbind(), saved in NewDataSet variable, and written to the working directory

-  Ninth the script melts the NewDataSet and then dcasts that data
   taking the mean for each activity, for each subject, for each variable

-  Tenth the new data set is written out to working directory
    