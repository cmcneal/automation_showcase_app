class ErrorPage < SitePrism::Page

  set_url "#{BASE_URL}/error"

  element :message, '#message'
  element :logout,  '#logout'

end
