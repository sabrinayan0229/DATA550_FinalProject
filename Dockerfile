# Use an official R base image
FROM r-base:latest

# Install pandoc and LaTeX for R Markdown support
RUN apt-get update && apt-get install -y \
    pandoc \
    texlive-latex-base \
    texlive-fonts-recommended \
    texlive-fonts-extra \
    texlive-latex-extra

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . /usr/src/app

# Install required R packages
RUN Rscript -e "install.packages(c('ggplot2', 'dplyr', 'kableExtra', 'knitr', 'rmarkdown'), repos='http://cran.rstudio.com/')"

# Make port 80 available to the world outside this container
EXPOSE 80

# Run app.R when the container launches
CMD ["Rscript", "code/analysis.R"]
