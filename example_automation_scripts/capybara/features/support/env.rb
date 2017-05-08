# encoding: utf-8
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'capybara/rspec'
require 'pry'
require 'rspec/expectations'
require 'site_prism'
require 'launchy'
require 'be_valid_asset'

# Capybara.default_driver = :selenium
Capybara.run_server              = false
Capybara.default_driver          = :poltergeist
Capybara.default_max_wait_time   = 30
# Capybara.app_host                = "localhost"
Capybara.app_host                = "https://automation-showcase-app.herokuapp.com"
# Capybara.save_and_open_page_path = "/features/screenshots"
