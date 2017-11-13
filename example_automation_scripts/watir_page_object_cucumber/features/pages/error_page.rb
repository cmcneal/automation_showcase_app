class ErrorPage

  include PageObject

  page_url "#{BASE_URL}/error"

  span :message, id: 'message'
  link :logout, id: 'logout'

end
