class HomePage < SitePrism::Page

  set_url "#{BASE_URL}/home"

  element :message, '#message'
  element :logout,  '#logout'

end
