Given %r{^I can sign in as (.*)$} do |user|
  @browser.goto(BASE_URL)

  expect(@browser.title).to eq('Test App')

  user == 'test' ? user = ' test ' : user
  @browser.text_field(id: 'username').set(user)
  @browser.button(id: 'login').click
end

Then %r{^I should be signed in and see (.*)$} do |message|
  page_message = @browser.span(id: 'message').text
  expect(page_message).to match(message)
end

Then %r{^I can sign out$} do
  logout = @browser.link(id: 'logout')
  expect(logout.present?).to be true
end
