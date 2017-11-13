# encoding: utf-8
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'site_prism'
# require 'selenium-webdriver'

# Local app
BASE_URL                         = 'http://localhost:4567'
# Heroku app
# BASE_URL                         = 'https://automation-showcase-app.herokuapp.com'

Capybara.run_server            = false
Capybara.default_driver        = :poltergeist
Capybara.default_max_wait_time = 30
Capybara.app_host              = BASE_URL
