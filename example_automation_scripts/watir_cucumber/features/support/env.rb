# encoding: utf-8
require 'watir'

$browser = Watir::Browser.new :chrome

# Local app
BASE_URL = 'http://localhost:4567'
# Heroku app
# BASE_URL = 'https://automation-showcase-app.herokuapp.com'
