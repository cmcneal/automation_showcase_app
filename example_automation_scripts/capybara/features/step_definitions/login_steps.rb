Given %r{^I can sign in as (.*)$} do |user|
  visit "https://automation-showcase-app.herokuapp.com"

  expect(page).to have_title 'Test App'

  user == 'test' ? user = ' test ' : user
  fill_in 'username', :with => user
  click_button 'Login'
end

Then %r{^I should be signed in and see (.*)$} do |message|
  expect(page).to have_content message
end

Then %r{^I can sign out$} do
  click_link 'logout'
end
