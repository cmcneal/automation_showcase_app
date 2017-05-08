class HomePage

  include PageObject

  page_url "https://automation-showcase-app.herokuapp.com/home"

  span :message, id: 'message'
  link :logout, id: 'logout'

end
