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
    && venv/bin/pip3 install numpy pandas seaborn

# RUN sh -c ". /opt/venv/bin/activate && pip3 install numpy pandas seaborn

# clone repo
RUN mkdir git \
    && cd git \
    && git clone https://github.com/joshtburdick/misc

# Install Node.js module dependencies
# COPY package.json .
# COPY package-lock.json .
# RUN npm install

###
# Let's get started!
#

# COPY . .

# CMD ["node", "start.js"]

RUN echo trying to run bash...
CMD ["bash"]

# RUN cd git/misc/countingBound/py/fractions
# CMD /app/venv/bin/python3 ./ip_bound_2.py
# CMD sh -c ". /opt/venv/bin/activate && exec ./ip_bound_2.py"

