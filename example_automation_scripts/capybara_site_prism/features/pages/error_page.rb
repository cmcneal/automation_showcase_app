class ErrorPage < SitePrism::Page

  set_url "https://automation-showcase-app.herokuapp.com/error"

  element :message, '#message'
  element :logout,  '#logout'

end
