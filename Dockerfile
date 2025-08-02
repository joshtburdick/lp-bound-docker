FROM node:18

RUN mkdir /app

ADD . /app

###
# Set up the working directory
#

WORKDIR /app

# install packages
RUN apt-get update \
    && apt-get install -y glpk-utils python3-pip python3-venv

# FIXME avoid root privileges sooner?

# install Python dependencies
RUN python3 -m venv venv \
    && venv/bin/pip3 install numpy scipy pandas seaborn pulp

# RUN sh -c ". /opt/venv/bin/activate && pip3 install numpy pandas seaborn

# clone repo
RUN mkdir git \
    && cd git \
    && git clone https://github.com/joshtburdick/misc

# run the bound
RUN cd /app
ENTRYPOINT ["ip_picky"]
