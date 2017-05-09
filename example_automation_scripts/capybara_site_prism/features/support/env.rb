# encoding: utf-8
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'site_prism'
# require 'selenium-webdriver'

# Capybara.register_driver :chrome do |app|
#   Capybara::Selenium::Driver.new(app, :browser => :chrome)
# end

# Capybara.javascript_driver     = :chrome

Capybara.run_server            = false
Capybara.default_driver        = :poltergeist
Capybara.default_max_wait_time = 30
Capybara.app_host              = "https://automation-showcase-app.herokuapp.com"
