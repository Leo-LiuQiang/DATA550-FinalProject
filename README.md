# Files description

## Code
### 01_Summary_Statistics_Table.R
This file generate summary statistics table for all variables in the dataset.

### 02_Regression_Model.R
This file generate summary table for regression model of "chronic.Lung.Disease ~ Age + Gender + Air.Pollution + Smoking + Obesity".

### 03_Age_Distribution.R
This file generate figure of the distribution of Age in the dataset (histogram).

### 04_Gender_Distribution.R
This file generate figure of the distribution of Gender in the dataset (boxplot).

### 05_Smoking_by_Gender.R
This file generate figure of the distribution of Smoking grouped by gender in the dataset (boxplot).

### 06_Chronic_Lung_Cancer_by_Age.R
This file generate figure of the distribution of Chronic Lung Cancer by Age in the dataset (scatterplot).

## Data
### cancer patient data sets.csv
This dataset contains information on patients with lung cancer, including their age, gender, air pollution exposure, alcohol use, dust allergy, occupational hazards, genetic risk, chronic lung disease, balanced diet, obesity, smoking, passive smoker, chest pain, coughing of blood, fatigue, weight loss ,shortness of breath ,wheezing ,swallowing difficulty ,clubbing of finger nails and snoring.

## Output
This is the path where tables and figures would be stored in.

## report.Rmd
This is the file to generate the final report html.

# How to generate the final report
## Generate it locally
You could using codes below in the terminal to generate the final report:

```cd "The working directory where you store the folder"```

To clean all files previously generated:

```make clean```

To restore the package environment for this project:

```make install```

Generate the final report:

```make```

## Generate from the online Docker image

```cd "The working directory where you store the folder"```

```make report/report.html```

Which will simultaneously pull the image repository and the report file will be synchronized to the report folder.

## If you want to build up a local image for your own with this project

```cd "The working directory where you store the folder"```

```make project_image```

```docker run -v "$$(pwd)/report":/project/report project_image```

And you will get the same output.