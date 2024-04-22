FROM r-base:latest

RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libcairo2-dev \
    libxt-dev \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-latex-extra \
    pandoc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
COPY . /usr/src/app

RUN Rscript -e "options(repos = list(CRAN = 'http://cran.rstudio.com/')); \
                install.packages(c('ggplot2', 'dplyr', 'kableExtra', 'knitr', 'rmarkdown'))"

EXPOSE 80

CMD ["Rscript", "code/analysis.R"]
