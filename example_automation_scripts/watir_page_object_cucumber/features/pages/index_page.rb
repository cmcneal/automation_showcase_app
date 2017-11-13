class IndexPage

  include PageObject

  page_url BASE_URL

  button :login, id: 'login'
  text_field :username, id: 'username'

  def has_expected_title?(expected_title)
    title == expected_title
  end
end
