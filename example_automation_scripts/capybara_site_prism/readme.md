# Capybara with site prism
> Acceptance test framework for web applications

|          |     |
|----------|-----|
|Website   |http://teamcapybara.github.io/capybara/|
|Language  |ruby |
|Drivers   |[poltergeist - phantomJS](https://github.com/teampoltergeist/poltergeist)
|          |selenium|
|          |webkit|
|          |RackTest|
|Framework | [Page-object](https://github.com/cheezy/page-object)|

## Installation
*

## Config/folder structure
```
.
project
|   cucumber.yml
|   Gemfile
|   Gemfile.lock
|   readme.md
|
\---features
    |   login.feature
    |
    +---pages
    |       error_page.rb
    |       home_page.rb
    |       index_page.rb
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
require 'site_prism'

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
  user == 'test' ? user = ' test ' : user

  @index = IndexPage.new
  @index.load
  expect(@index.title).to eq 'Test App'

  @index.username.set(user)
  @index.login.click
end

Then %r{^I should be signed in and see (.*)$} do |message|
  @logged_in = message =~ /You are now signed/ ? true : false
  @page      = @logged_in ? HomePage.new : ErrorPage.new
  expect(@page.message.text).to match(message)
end

Then %r{^I can sign out$} do
  @page = @logged_in ? HomePage.new : ErrorPage.new
  @page.logout
end
```

`index_page.rb`
```ruby
class IndexPage < SitePrism::Page

  set_url "https://automation-showcase-app.herokuapp.com"

  element :login,    '#login'
  element :username, '#username'

end
```

`error_page.rb`
```ruby
class ErrorPage < SitePrism::Page

  set_url "https://automation-showcase-app.herokuapp.com/error"

  element :message, '#message'
  element :logout,  '#logout'

end
```

`home_page.rb`
```ruby
class HomePage < SitePrism::Page

  set_url "https://automation-showcase-app.herokuapp.com/home"

  element :message, '#message'
  element :logout,  '#logout'

end
```
