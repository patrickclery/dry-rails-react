FROM ruby:2.6.5-stretch

# Setup the base OS
RUN apt-get update -qq
# Remove non-critical error messages: https://github.com/moby/moby/issues/27988
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
RUN apt-get install -y --no-install-recommends build-essential  \
    apt-transport-https curl ca-certificates postgresql-client

# Install yarn and node from sources
RUN curl -sSL https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update -qq
RUN apt-get install -y nodejs yarn
RUN apt autoremove -y

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
RUN mkdir -p tmp/pids

# default entrypoint
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# This gets passed to entrypoint.sh upon run
CMD ["puma", "-C", "config/puma.rb"]
