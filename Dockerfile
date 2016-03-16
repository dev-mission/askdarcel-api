FROM ruby:2.2
MAINTAINER shannonrdunn@gmail.com

RUN apt-get update && apt-get install -y \
  build-essential

RUN mkdir -p /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install --jobs 20 --retry 5

# Copy the main application.
COPY . ./


EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]
