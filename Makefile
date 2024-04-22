all: report.html

report.html: report/report.Rmd
	Rscript -e "rmarkdown::render('report/report.Rmd')"

table.csv: code/table.R
	Rscript code/table.R

plot.png: code/figure.R
	Rscript code/figure.R

clean:
	rm -f report/report.html report/table.csv report/plot.png

install:
	Rscript -e 'renv::restore()'

.PHONY: build-image run-report

build-image:
	docker build -t username/myproject .

run-report:
	docker run -v $(shell pwd)/report:/usr/src/app/report sabrinayan0229/data550_final