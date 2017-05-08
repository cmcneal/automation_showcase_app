class ErrorPage

  include PageObject

  page_url "https://automation-showcase-app.herokuapp.com/error"

  span :message, id: 'message'
  link :logout, id: 'logout'

end
