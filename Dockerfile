# Using official Ruby runtime base image
FROM ruby:2.3.1

MAINTAINER "Toshiki Inami <t-inami@arukas.io>"

RUN apt-get -yqq update
RUN apt-get -yqq install net-tools

# Set the applilcation directory
ENV APP_HOME /app
RUN mkdir $APP_HOME
WORKDIR $APP_HOME

# Install gems
COPY ./sinatra/Gemfile $APP_HOME/
RUN bundle install

# Copy our code from the current folder to /app inside the container
COPY . $APP_HOME

# Make port 4657 available for publish
EXPOSE 4567

# Start server
CMD ["ruby", "sinatra/myapp.rb"]
