
FROM rocker/tidyverse:latest

RUN install2.r --error --deps TRUE table1 here renv kableExtra plotly

WORKDIR /usr/src/app

COPY ./code /usr/src/app/code
COPY ./data /usr/src/app/data

RUN apt-get update && apt-get install -y --no-install-recommends \
    texlive-xetex \
    texlive-fonts-recommended \
    texlive-plain-generic \
    && rm -rf /var/lib/apt/lists/*


ENV PATH="${PATH}:/root/bin"

CMD ["Rscript", "code/analysis.R"]
