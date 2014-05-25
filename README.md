## Data Science Specialization - Coursera: Getting and Cleaning Data Project


The following offers a operational description of run_analysis.R.

    Assuming that run_analysis.R is being executed in the working directory
    where the data zipfile has been unzipped:

    	 -  First the script double checks the current directory getwd () and 
  	    allows for the setting of the proper directory if necessary setwd()   
         
     	-  Second the script loads packages and libraries that are assumed
           common for data scrubbing tasks

     	-  Third the script reads in the text files from the the working
 	   directory that are needed for data processing (e.g../test/y_test.txt")
 
     	-  Fourth the script binds the the rows from the data sets that 
	   were read in from the text files.This allows for vertical
	   integration of the dataframes Testset and Trainset

     	-  Fifth the script reads in the feature.txt data
 
     	-  Sixth the TestLabels and Trainlabels are vertically integrated 
	   using rbind and activity labels read into R. 

     	-  Seventh Subject.idTest and Subject.idTrain are vertically integrated 
	   using rbind and and stored in Subject.ID.
		
     	-  Eigth Subject.ID,ActivityLabels and Dataset are intergrated by column and 
	   written out to working directory

     	-  Ninth the script melts the cleaned data set and then dcasts that data
	   taking the mean for each activity, for each subject, for each variable

     	-  Tenth the new data set is written out to working directory