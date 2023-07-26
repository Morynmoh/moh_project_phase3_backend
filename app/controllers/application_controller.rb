# class ApplicationController < Sinatra::Base

  
#   # Add your routes here
#   

#   
# end
class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # configure do
  #   set :public_folder, 'public'
  #   # set :views, 'app/views'
  #   enable :sessions
  #   set :session_secret, "bananas_in_pajamas" #ENV.fetch('SESSION_SECRET')
  # end
  get "/users" do
        users = User.all 
        users.to_json
  end
  post "/users" do
        user = User.create(params)
        if user.valid?
          { user: user, message: "User created successfully" }.to_json
        else
          { message: "User creation failed" }.to_json 
        end
      end

  # get "/" do
  #   if logged_in?
  #     redirect to('/expenses')
  #   else
  #     erb :welcome
  #   end
  # end

  # helpers do

  #   def current_user
  #     @current_user ||= User.find(session[:user_id])
  #   end

  #   def logged_in?
  #     !!session[:user_id]
  #   end

  # end

end