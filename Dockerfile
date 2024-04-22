FROM rocker/tidyverse:latest
RUN install2.r --error table1 here renv kableExtra plotly

WORKDIR /usr/src/app
COPY ./code /usr/src/app/code
COPY ./data /usr/src/app/data

CMD ["Rscript", "code/analysis.R"]
