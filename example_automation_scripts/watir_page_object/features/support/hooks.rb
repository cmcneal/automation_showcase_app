Before do
  @browser = $browser
  @base_url = 'https://automation-showcase-app.herokuapp.com'
end

at_exit do
  $browser.close
end
