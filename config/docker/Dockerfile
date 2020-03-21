FROM ruby:2.6.5-stretch

# Setup the base OS
RUN apt-get update -qq \
 && apt-get install -y --no-install-recommends build-essential  \
    apt-transport-https curl ca-certificates gnupg2 apt-utils nodejs

# Install node from nodesource
# uncomment the next 2 lines for fix
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
  && apt-get install -y nodejs

# Install yarn
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
 && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
 && apt-get update -qq \
 && apt-get install -y yarn

# Install PG client
RUN apt-get install -y postgresql-client

# Create our app directory
RUN mkdir -p /app
WORKDIR /app

# Install bundler then all gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler
RUN bundle update --bundler
RUN bundle install

# Copy everything else
COPY . ./

# Clear any local package files that might get copied
RUN rm -rf ./node_modules ./coverage/*
RUN yarn install --no-optional
RUN rails tmp:clear log:clear

# Use the docker's database.yml which is dynamically loaded based on ENV vars
COPY ./config/docker/database.yml ./config/

# default entrypoint
COPY ./config/docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# This gets passed to entrypoint.sh upon run
CMD ["rails", "server", "-b", "0.0.0.0"]
