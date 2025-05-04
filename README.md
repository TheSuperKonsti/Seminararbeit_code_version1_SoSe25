# Seminararbeit_code_version1_SoSe25
R code for the first version of th seminar paper

This code is recommended to be used with RStudio

The first lines of the code are used to clean the environment, set the seed for reproducibility (not needed in this case) and to make sure that all necessary packages are installed.
Then the code reads the necessary Excel sheet and starts to clean the data (it takes only the needed parts of the very large dataset).
The code then chooses the year as 2022 and converts the Population_2022 column into numeric format.

Then the Benford analysis is made.

The first is done with only the first digit and then visualizes the results. 
afterwards the code creates a png of the Console output.

This code is then repeated for the Benford analysis with the first two digits (this is the default from the benford() function).
