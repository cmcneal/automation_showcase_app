class HomePage < SitePrism::Page

  set_url "https://automation-showcase-app.herokuapp.com/home"

  element :message, '#message'
  element :logout,  '#logout'

end
