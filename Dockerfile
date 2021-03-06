FROM base

RUN apt-get -y install software-properties-common python g++ make git
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get -y install nodejs

# install scipy
RUN apt-get -y install python-pip
RUN apt-get -y install python-setuptools
RUN apt-get -y install python-dev build-essential
RUN apt-get install -y python-numpy
RUN apt-get install -y python-scipy
RUN pip install -U scikit-learn
RUN apt-get install -y python-pandas
#RUN pip install -U pandas
RUN easy_install statsmodels
RUN pip install -U yhat


# install R
RUN apt-get -y install r-base
RUN pip install rpy2
RUN apt-get -y install libcurl4-openssl-dev
#setup R configs
#RUN echo "r <- getOption('repos'); r['CRAN'] <- 'http://cran.us.r-project.org'; options(repos = r);" > ~/.Rprofile

# install ruby
RUN apt-get -y install ruby1.9.3
RUN gem install json

# install Ipython
RUN pip install ipython

ADD . /node-sci
# install pandasjson
RUN cd node-sci/lib/; pip install pandasjson/

EXPOSE 3000

RUN cd /node-sci; npm install -g;

