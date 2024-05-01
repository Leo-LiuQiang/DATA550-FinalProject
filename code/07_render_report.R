here::i_am("code/07_render_report.R")

library(rmarkdown)

# rendering a report
render(
  "report.Rmd",
  output_file = "report.html"
)
