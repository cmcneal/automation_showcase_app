# Watir with page-object
> An open source Ruby library for automating tests.

|          |                                  |
|----------|----------------------------------|
|Website   | http://watir.github.io/          |
|Language  | ruby                             |
|Drivers   | Selenium/WebDriver               |
|          | SauceLabs                        |
|          | PhantomJS                        |
|          | ....                             |
|Framework | [Page-object](https://github.com/cheezy/page-object)|

## Installation
*

## Config/folder structure
```
.
project
|   cucumber.yml
|   debug.log
|   Gemfile
|   Gemfile.lock
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
            hooks.rb
```

## Example
`env.rb`
```ruby
require 'page-object'
require 'page-object/page_factory'
require 'watir'

World(PageObject::PageFactory)

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
  user == 'test' ? user = ' test ' : user

  visit(IndexPage) do |page|
    page.has_expected_title?
    page.username = user
    page.login
  end
end

Then %r{^I should be signed in and see (.*)$} do |message|
  @logged_in = message =~ /You are now signed/ ? true : false
  page_message = @logged_in ? on(HomePage).message : on(ErrorPage).message
  expect(page_message).to match(message)
end

Then %r{^I can sign out$} do
  @logged_in ? on(HomePage).logout : on(ErrorPage).logout
end
```

`index_page.rb`
```ruby
class IndexPage

  include PageObject

  page_url "https://automation-showcase-app.herokuapp.com"
  expected_title = "Test App"

  button :login, id: 'login'
  text_field :username, id: 'username'

end
```

`error_page.rb`
```ruby
class ErrorPage

  include PageObject

  page_url "https://automation-showcase-app.herokuapp.com/error"

  span :message, id: 'message'
  link :logout, id: 'logout'

end
```

`home_page.rb`
```ruby
class HomePage

  include PageObject

  page_url "https://automation-showcase-app.herokuapp.com/home"

  span :message, id: 'message'
  link :logout, id: 'logout'

end
```
