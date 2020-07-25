class UsersController < ApplicationController
    
    get '/signup' do 
        if Helpers.logged_in?(session)
            redirect to "/tweets"
        end
        erb :'/users/create_user'
      end 

    post '/signup' do 
        if params["username"].empty? || params["email"].empty? || params["password"].empty?
            redirect to "/signup"
        else
            @user = User.new(username: params["username"], email: params["email"], password: params["password"])
            @user.save
            session[:user_id] = @user.id
            redirect to "/tweets"
        end
    end

end
