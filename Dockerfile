FROM node:18

RUN mkdir /app

ADD . /app

###
# Set up the working directory
#

WORKDIR /app

# install packages
RUN apt-get update \
    && apt-get install -y glpk-utils

# Install Node.js module dependencies
COPY package.json .
COPY package-lock.json .
RUN npm install

###
# Let's get started!
#

COPY . .

EXPOSE 5000

CMD ["node", "start.js"]
