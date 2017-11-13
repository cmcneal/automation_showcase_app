Given %r{^I can sign in as (.*)$} do |user|
  user == 'test' ? user = ' test ' : user

  visit BASE_URL
  expect(page).to have_title 'Test App'
  fill_in      'username', :with => user
  click_button 'Login'
end

Then %r{^I should be signed in and see (.*)$} do |message|
  expect(page).to have_content message
end

Then %r{^I can sign out$} do
  click_link 'logout'
end
