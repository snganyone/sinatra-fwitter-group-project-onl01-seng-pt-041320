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
    @user.save

    if params["username"].empty? || params["email"].empty? || params["password"].empty?
      redirect "/signup"
    else
      redirect "/tweets"
    end
    
  end

end
