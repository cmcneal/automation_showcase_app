Given %r{^I can sign in as (.*)$} do |user|
  user == 'test' ? user = ' test ' : user

  visit(IndexPage) do |page|
    page.has_expected_title?
    page.username = user
    page.login
  end
end

Then %r{^I should be signed in and see (.*)$} do |message|
  @logged_in = message =~ /You are now signed/ ? true : false
  page_message = @logged_in ? on(HomePage).message : on(ErrorPage).message
  expect(page_message).to match(message)
end

Then %r{^I can sign out$} do
  @logged_in ? on(HomePage).logout : on(ErrorPage).logout
end
