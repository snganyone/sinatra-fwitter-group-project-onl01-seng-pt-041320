require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    erb :index
  end

  get '/signup' do 
    erb :'/users/create_user'
  end

  post '/signup' do 
    #binding.pry
    @user = User.create(username: params["username"], email: params["email"], password: params["password"])

    if !params
    @user.save
    
    redirect "/tweets"
  end

end
