FROM ruby:3.3.5-alpine
RUN apk update && apk add --no-cache build-base

WORKDIR /app

# App files
COPY . /app/

# Install gems.
RUN bundle install --jobs 4 --retry 3



CMD ["rake", "run"]