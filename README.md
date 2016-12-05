==================================================================
Tidying the Human Activity Recognition Using Smartphones Dataset
Version 1.0
==================================================================
The R script run_analysis.R reads the test and training data sets for Human Activity Recognition Using Smartphones, and creates a tidy data in the file set activity_averages.txt. The tidy data set contains the averages of various measures. More information is available in run_analysis.md.

To read the tidy data set, you may use the read.file() function with the parameter header = FALSE.
Example: tidy_data <- read.table("<file path>/activity_averages.txt", header = FALSE)

The codebook file for the features is features_averages_info.txt

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.