FROM ruby:3.0.2-bullseye

# Throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

# Set the working directory
WORKDIR /app

# Install libsodium and opus (external dependencies for using voice features)
RUN apt-get update && apt-get install --yes libsodium-dev libopus-dev ffmpeg

# Install gem dependencies
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Run the main command
CMD ["ruby", "yoluld.rb"]
