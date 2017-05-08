class IndexPage

  include PageObject

  page_url "https://automation-showcase-app.herokuapp.com"
  expected_title = "Test App"

  button :login, id: 'login'
  text_field :username, id: 'username'

end
