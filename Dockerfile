FROM base

RUN apt-get -y install software-properties-common python g++ make git
RUN add-apt-repository ppa:chris-lea/node.js
RUN apt-get update
RUN apt-get -y install nodejs

RUN git clone git@github.com:glamp/node-sci.git
RUN cd node-sci; npm start;


