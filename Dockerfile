FROM node:18

RUN mkdir /app

ADD . /app

###
# Set up the working directory
#

WORKDIR /app

# install packages
RUN apt-get update \
    && apt-get install -y glpk-utils python3-pip

# FIXME avoid root privileges sooner?

# install Python dependencies
RUN python3 -m pip install numpy pandas seaborn

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

# EXPOSE 5000

# CMD ["node", "start.js"]

RUN cd git/misc/countingBound/py/fractions

CMD ["./ip_bound_2.py"]

