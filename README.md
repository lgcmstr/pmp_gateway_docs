This app is built with [Middleman](https://middlemanapp.com/).

The documentation is hosted at: http://appriss-operations.github.io/narxcheck_docs.

## Setup local dev environment
## Need to install bundler since ruby version set to 2.2.2

Install gems to local repo
````
$ gem install bundler
$ bundle install --path vendor/bundle
````

## Working from local dev environment
Start local Middleman server
````
$ bundle exec middleman server
````

access the local server at: http://localhost:4567/

Build and deploy local changes to the public site using the [middleman-gh-pages](https://github.com/edgecase/middleman-gh-pages) gem
````
$ git add .
$ git commit -m COMMIT_MESSAGE
$ git push
$ bundle exec rake build
$ bundle exec rake publish
````
