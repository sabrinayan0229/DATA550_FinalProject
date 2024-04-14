all: report.html

report.html: report/report.Rmd table.csv plot.png
	Rscript -e 'rmarkdown::render("report/report.Rmd", output_format = "html_document")'

table.csv: code/table.R
	Rscript code/table.R

plot.png: code/figure.R
	Rscript code/figure.R

clean:
	rm -f report/report.html report/table.csv report/plot.png

install:
	Rscript -e 'renv::restore()'
