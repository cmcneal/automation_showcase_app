Given %r{^I can sign in as (.*)$} do |user|
  user == 'test' ? user = ' test ' : user

  @index = IndexPage.new
  @index.load
  expect(@index.title).to eq 'Test App'

  @index.username.set(user)
  @index.login.click
end

Then %r{^I should be signed in and see (.*)$} do |message|
  @logged_in = message =~ /You are now signed/ ? true : false
  @page      = @logged_in ? HomePage.new : ErrorPage.new
  expect(@page.message.text).to match(message)
end

Then %r{^I can sign out$} do
  @page = @logged_in ? HomePage.new : ErrorPage.new
  @page.logout
end
