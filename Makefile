# REPORT-ASSOCIATED RULES
report.html: code/07_render_report.R \
  report.Rmd Exploratory_data_analysis
	Rscript code/07_render_report.R

.PHONY: Exploratory_data_analysis
Exploratory_data_analysis: output/Summary_Statistics_Table.rds output/Regression_Model_Table.rds \
	output/Age_Distribution.png output/Gender_Distribution.png output/Smoking_by_Gender.png \
	output/Chronic_Lung_Cancer_by_Age.png

output/Summary_Statistics_Table.rds: code/01_Summary_Statistics_Table.R
	Rscript code/01_Summary_Statistics_Table.R

output/Regression_Model_Table.rds: code/02_Regression_Model.R
	Rscript code/02_Regression_Model.R

output/Age_Distribution.png: code/03_Age_Distribution.R
	Rscript code/03_Age_Distribution.R

output/Gender_Distribution.png: code/04_Gender_Distribution.R
	Rscript code/04_Gender_Distribution.R

output/Smoking_by_Gender.png: code/05_Smoking_by_Gender.R
	Rscript code/05_Smoking_by_Gender.R

output/Chronic_Lung_Cancer_by_Age.png: code/06_Chronic_Lung_Cancer_by_Age.R
	Rscript code/06_Chronic_Lung_Cancer_by_Age.R

.PHONY: clean
clean:
	rm -f output/*.rds && rm -f output/*.png && rm -f *.html
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"
	
# DOCKER-ASSOCIATED RULES
PROJECTFILES = code/01_Summary_Statistics_Table.R code/02_Regression_Model.R code/03_Age_Distribution.R \
	code/04_Gender_Distribution.R code/05_Smoking_by_Gender.R code/06_Chronic_Lung_Cancer_by_Age.R \
	code/07_render_report.R Makefile
RENVFILES = renv.lock renv/activate.R renv/settings.json

# rule to build image
# $@ evaluates to the target name in make
project_image: Dockerfile $(PROJECTFILES) $(RENVFILES)
	docker build -t project_image .
	touch $@

# rule to build the report automatically in our container
report/report.html:
	docker run -v "$$(pwd)/report":/project/report leoqiang/project_image