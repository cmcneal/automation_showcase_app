# Watir
> An open source Ruby library for automating tests.

|          |                                  |
|----------|----------------------------------|
|Website   | http://watir.github.io/          |
|Language  | ruby                             |
|Drivers   | Selenium/WebDriver               |
|          | SauceLabs                        |
|          | PhantomJS                        |
|          | ....                             |
|Interface |Cucumber                          |

## Installation
* Install ruby
* Install the bundler gem

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
            hooks.rb
```

## Example
`env.rb`
```ruby
require 'watir'

$browser = Watir::Browser.new :chrome
```

`hooks.rb`
```ruby
Before do
  @browser = $browser
end

at_exit do
  $browser.close
end
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
  @browser.goto('https://automation-showcase-app.herokuapp.com')

  expect(@browser.title).to eq('Test App')

  user == 'test' ? user = ' test ' : user
  @browser.text_field(id: 'username').set(user)
  @browser.button(id: 'login').click
end

Then %r{^I should be signed in and see (.*)$} do |message|
  page_message = @browser.span(id: 'message').text
  expect(page_message).to match(message)
end

Then %r{^I can sign out$} do
  logout = @browser.link(id: 'logout')
  expect(logout.present?).to be true
end
```
