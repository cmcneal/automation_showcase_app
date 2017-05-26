require 'sinatra'

$users        = [' test ', 'alpha', "'username'"]
$current_user = ''
$pass         = true

get '/' do
  erb :index
end

get '/create_user' do
  erb :create_user
end

get '/home' do
  erb :home
end

get '/error' do
  erb :error
end

get '/space_error' do
  erb :space_error
end

post '/create_user' do
  if $users.include?(params[:username])
    $message = "User '#{params[:username]}' already exists."
    $pass = true
    redirect '/users'
  elsif params[:username] == 'username'
    $message = "Username cannot be 'username'"
    $pass = false
    redirect '/users'
  else
    $users << params[:username]
    $message = "User '#{params[:username]}' created."
    $pass = false
    redirect '/users'
  end
end

get '/login' do
  redirect '/index'
end

post '/login' do
  if $users.include?(params[:username])
    $current_user = params[:username]
    redirect '/home'
  else
  	redirect '/error'
  end
end

get '/users' do
  erb :users
end

get '/presentation' do
  redirect '/presentation/SQDG_May_25_2017_Automation_Showcase.html'
end

get '/pdf' do
  redirect '/presentation/SQDG_May_25_2017_Automation_Showcase.pdf'
end
