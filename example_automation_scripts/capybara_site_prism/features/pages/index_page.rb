class IndexPage < SitePrism::Page

  set_url "https://automation-showcase-app.herokuapp.com"

  element :login,    '#login'
  element :username, '#username'

end
