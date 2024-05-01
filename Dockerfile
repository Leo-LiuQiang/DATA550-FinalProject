FROM rocker/r-ubuntu

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y pandoc
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libfontconfig1-dev

RUN mkdir /project
WORKDIR /project

RUN mkdir code
RUN mkdir data
RUN mkdir output
RUN mkdir renv
RUN mkdir report
COPY code code
COPY data data
COPY output output
COPY renv renv
COPY Makefile .
COPY report.Rmd .
COPY .Rprofile .
COPY renv.lock .
COPY renv/activate.R renv
COPY renv/settings.json renv

RUN Rscript -e "install.packages('xml2', configure.vars='INCLUDE_DIR=/usr/local/opt/libxml2/include/libxml2 LIB_DIR=/usr/local/opt/libxml2/lib/')"
RUN Rscript -e "renv::restore(prompt = FALSE)"

CMD make && mv report.html report