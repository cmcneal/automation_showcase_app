class IndexPage < SitePrism::Page

  set_url BASE_URL

  element :login,    '#login'
  element :username, '#username'

end
