# Using official Ruby runtime base image
FROM ruby:2.3.1-slim

MAINTAINER "Toshiki Inami <t-inami@arukas.io>"

# Install net-tools, and then clean up
RUN apt-get update && \
    apt-get install -y git && \
    apt-get clean && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set the applilcation directory
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install gems
COPY ./sinatra/Gemfile $APP_HOME/
RUN bundle install --jobs=4

# Copy our code from the current folder to /app inside the container
COPY . $APP_HOME

# Make port 4657 available for publish
EXPOSE 4567

# Start server
CMD ["ruby", "sinatra/myapp.rb", "-o", "0.0.0.0"]
