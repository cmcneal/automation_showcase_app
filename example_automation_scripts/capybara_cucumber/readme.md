# Capybara with Cucumber
> Acceptance test framework for web applications

|         |     |
|---------|-----|
|Website  |http://teamcapybara.github.io/capybara/|
|Language |ruby |
|Drivers  |[poltergeist - phantomJS](https://github.com/teampoltergeist/poltergeist)
|         |selenium|
|         |webkit|
|         |RackTest|
|Interface|Cucumber|

## Installation
* Install ruby
* Install the bundler gem
* Install poltergeist

## Running the test
* Ensure that the sample app is running
* Modify `env.rb`
** If you are running against the app locally, us the *Local* **BASE_URL**
** If you are running against the app remotely, us the *Heroku* **BASE_URL**
* Navigate to this folder
* Run `bundle install`
* Then `bundle exec cucumber`

## Config/folder structure
```
.
project
|   cucumber.yml
|   Gemfile
|   Gemfile.lock
|
\---features
    |   login.feature
    |
    +---step_definitions
    |       login_steps.rb
    |
    \---support
            env.rb
```

## Example
`env.rb`
```ruby
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'capybara/rspec'

Capybara.run_server              = false
Capybara.default_driver          = :poltergeist
Capybara.default_max_wait_time   = 30
Capybara.app_host                = "https://automation-showcase-app.herokuapp.com"
```

`login.feature`
```cucumber
Feature: Verify that the correct users can login
  In order to verify that the test app login works
  As a test user
  I need to sign in as each of the test users

Scenario Outline: Sign in, sign out
  Given I can sign in as <user>
   Then I should be signed in and see <message>
    And I can sign out

Examples:
|user|message|
|alpha|You are now signed|
| test |You are now signed|
|error|Username was incorrect.|
```

`login_steps.rb`
```ruby
Given %r{^I can sign in as (.*)$} do |user|
  visit "https://automation-showcase-app.herokuapp.com"

  expect(page).to have_title 'Test App'

  user == 'test' ? user = ' test ' : user
  fill_in 'username', :with => user
  click_button 'Login'
end

Then %r{^I should be signed in and see (.*)$} do |message|
  expect(page).to have_content message
end

Then %r{^I can sign out$} do
  click_link 'logout'
end
```
