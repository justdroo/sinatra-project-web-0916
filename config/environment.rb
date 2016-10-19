require 'bundler/setup'
Bundler.require

require_all('app/')

set :database, {adapter: "sqlite3", database: "db/database.sqlite3"}

require 'yelp'

Yelp.client.configure do |config|
  config.consumer_key = 'E7_nd_2VF8ChwlVnO5p5Vg'
  config.consumer_secret = 'N5g0l5myruZvvneYRBVtjmBNWfc'
  config.token = 'e1K6iMu0nXv317PJO8nDoslLwlwnk4hu'
  config.token_secret = 'OT6YMQMeeUKco7OGLGuVDisAgXk'
end
