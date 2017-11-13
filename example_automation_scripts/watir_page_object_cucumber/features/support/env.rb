# encoding: utf-8
require 'page-object'
require 'page-object/page_factory'
require 'watir'
require 'pry'

World(PageObject::PageFactory)

$browser = Watir::Browser.new :chrome

# Local app
BASE_URL = 'http://localhost:4567'
# Heroku app
# BASE_URL = 'https://automation-showcase-app.herokuapp.com'
