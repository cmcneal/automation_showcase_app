class HomePage

  include PageObject

  page_url "#{BASE_URL}/home"

  span :message, id: 'message'
  link :logout, id: 'logout'

end
