## Data Science Specialization - Coursera: Project Code Book


The following offers information about experimental study design, data transformations, and provides a code book.

I.Study Design:
	
	Introduction:

	The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
	Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
	wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we 
	captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments 
	have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, 
	where 70% of the volunteers was selected for generating the training data and 30% the test data. 
	The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in 
	fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which 
	has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
	The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
	From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 

	Data Secured From: 

 		Website:    http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

		Located in: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
	
	
II.Data Transformations:

-  First the script double checks the current directory (getwd ())and 
   allows for the setting of the proper directory if necessary (setwd())    
         
-  Second the script loads packages and libraries that are assumed
   common for data scrubbing tasks of this nature

-  Third the script offers the ability create new files and 
   directories. Since this script assumes that you are in the 
   working directory, this is probably a moot point but is there
   in any case.

-  Fourth the script reads in the text files from the the working
   directory that are needed for data processing (e.g../test/y_test.txt")
 
-  Fifth the script binds the the rows from the data sets that 
   were read in from the text files.

-  Sixth the script reads in the feature data (feature.txt) then:

		1. Names each column in the file
                2. Assigns the Frequency Domain Signal Column to varible x
		3. Pattern Matches using \\ to escape for grep and R
		   Locate the patterns and return the matched index(Value=TRUE)
		4. This is repeated for the Mean and Standard Deviation seperatly
		5. The sets of indices are concatenated and sorted in the proper order
		6. The indices are used to index the Dataset 
		7. The column names are cleaned through removing and replacing characters
	           in the selected datasets
 
-  Seventh the TestLabels and Trainlabels are combined
   using rbind() and activity labels are read into R. Next:

 	 	1. Activity Columns are renamed
                2. The the Frequency Domain Signal Column is assigned to varible x
		   (note: x was chose to match the genral for of grep())
		3. Pattern Matches replacing "-" using grep
		4. The cleaned activity description column is stored 
		   in ActivityLabs

-  Eighth Subject.idTest and Subject.idTrain are integrated 
   using rbind() and and stored in Subject.ID. Next:

 	 	1. The "Subject.ID" name is given to Subject.ID
		2. The Subject ID, Activity Levels, and DataSet
		   where integrated and created a new data frame called NewDataSet
		4. The new data is checked for correctness
		
-  Ninth the new data set from set eight is written out to working directory


-  Tenth the script reshapes the NewDataSet using the melt() and dcast().The dcast() takes
   the mean for each activity, for each subject, for each variable

-  Eleventh the new data set from step ten is written out to working directory

    
III. Codebook: 

	
	These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. 
	Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner 
	frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and 
	gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter 
	with a corner frequency of 0.3 Hz.and The units are radians/second. 
	(Note: Acc  for X,Y,Z:standard gravity units 'g')
	(Note: Gyro for X,Y,Z:units are radians/second) 
	(Note: Mean and Standard Deviation of these measures for each axis)
	
	"1"  "tBodyAcc.MeanValues.X"
	"2"  "tBodyAcc.MeanValues.Y"
	"3"  "tBodyAcc.MeanValues.Z"
	"4"  "tBodyAcc.StdValues.X"
	"5"  "tBodyAcc.StdValues.Y"
	"6"  "tBodyAcc.StdValues.Z"
	"7"  "tGravityAcc.MeanValues.X"
	"8"  "tGravityAcc.MeanValues.Y"
	"9"  "tGravityAcc.MeanValues.Z"
	"10" "tGravityAcc.StdValues.X"
	"11" "tGravityAcc.StdValues.Y"
	"12" "tGravityAcc.StdValues.Z"

	The body linear acceleration and angular 
	velocity were derived in time to obtain Jerk signals 
	(tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ)
	(Note: Acc  for X,Y,Z:standard gravity units 'g')
	(Note: Gyro for X,Y,Z:units are radians/second) 
	(Note: These varibles capture the Mean and Standard Deviation for each axis)

	"13" "tBodyAccJerk.MeanValues.X"
	"14" "tBodyAccJerk.MeanValues.Y"
	"15" "tBodyAccJerk.MeanValues.Z"
	"16" "tBodyAccJerk.StdValues.X"
	"17" "tBodyAccJerk.StdValues.Y"
	"18" "tBodyAccJerk.StdValues.Z"
	
	"19" "tBodyGyro.MeanValues.X"
	"20" "tBodyGyro.MeanValues.Y"
	"21" "tBodyGyro.MeanValues.Z"
	"22" "tBodyGyro.StdValues.X"
	"23" "tBodyGyro.StdValues.Y"
	"24" "tBodyGyro.StdValues.Z"
	"25" "tBodyGyroJerk.MeanValues.X"
	"26" "tBodyGyroJerk.MeanValues.Y"
	"27" "tBodyGyroJerk.MeanValues.Z"
	"28" "tBodyGyroJerk.StdValues.X"
	"29" "tBodyGyroJerk.StdValues.Y"
	"30" "tBodyGyroJerk.StdValues.Z"
	
 	The magnitude of these three-dimensional signals were 
	calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, 
	tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
	(Note: Acc :standard gravity units 'g')
	(Note: Gyro:units are radians/second) 
	(Note: These varibles capture the Mean and Standard Deviation for each magnitude)

	
	"31" "tBodyAccMag.MeanValues"
	"32" "tBodyAccMag.StdValues"
	"33" "tGravityAccMag.MeanValues"
	"34" "tGravityAccMag.StdValues"
	
	"35" "tBodyAccJerkMag.MeanValues"
	"36" "tBodyAccJerkMag.StdValues"
	
	"37" "tBodyGyroMag.MeanValues"
	"38" "tBodyGyroMag.StdValues"
	
	"39" "tBodyGyroJerkMag.MeanValues"
	"40" "tBodyGyroJerkMag.StdValues"
	
	A Fast Fourier Transform (FFT) was applied to some of these 
	signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, 
	fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. 
	(Note the 'f' to indicate frequency domain signals). 
	(Note: These varibles capture the Mean and Standard Deviation for each axis)

	"41" "fBodyAcc.MeanValues.X"
	"42" "fBodyAcc.MeanValues.Y"
	"43" "fBodyAcc.MeanValues.Z"
	"44" "fBodyAcc.StdValues.X"
	"45" "fBodyAcc.StdValues.Y"
	"46" "fBodyAcc.StdValues.Z"
	
	"47" "fBodyAccJerk.MeanValues.X"
	"48" "fBodyAccJerk.MeanValues.Y"
	"49" "fBodyAccJerk.MeanValues.Z"
	"50" "fBodyAccJerk.StdValues.X"
	"51" "fBodyAccJerk.StdValues.Y"
	"52" "fBodyAccJerk.StdValues.Z"
	
	"53" "fBodyGyro.MeanValues.X"
	"54" "fBodyGyro.MeanValues.Y"
	"55" "fBodyGyro.MeanValues.Z"
	"56" "fBodyGyro.StdValues.X"
	"57" "fBodyGyro.StdValues.Y"
	"58" "fBodyGyro.StdValues.Z"
	
	"59" "fBodyAccMag.MeanValues"
	"60" "fBodyAccMag.StdValues"
	"61" "fBodyBodyAccJerkMag.MeanValues"
	"62" "fBodyBodyAccJerkMag.StdValues"
	
	"63" "fBodyBodyGyroMag.MeanValues"
	"64" "fBodyBodyGyroMag.StdValues"
	"65" "fBodyBodyGyroJerkMag.MeanValues"
	"66" "fBodyBodyGyroJerkMag.StdValues"