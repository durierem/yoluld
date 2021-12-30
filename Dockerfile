FROM ruby:3.1.0-alpine

# Set the working directory
WORKDIR /app

# Install libsodium and opus (external dependencies for using voice features)
RUN apk add build-base libsodium-dev libopusenc-dev ffmpeg

# Install gem dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle config --global frozen 1 \
    && bundle config set --global without development test \
    && bundle install

# Run the main command
CMD bundle exec ruby yoluld.rb
