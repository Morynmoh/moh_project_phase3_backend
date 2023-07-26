require 'sinatra/base'

class UsersController < Sinatra::Base
set :default_content_type, 'application/json'

    get '/users/new' do
        render 'users/new'
    end

  post '/users' do
    username = params[:username]
    password = params[:password]

    if User.find_by(username: username)
      flash[:error] = 'Username already exists'
      redirect '/users/new'
    else
      user = User.new(username: username, password: password)
      user.save!

      session[:user_id] = user.id
      redirect '/'
    end
  end

  get '/users/:id' do
    @user = User.find(params[:id])
    render 'users/show'
  end

  get '/' do
    render 'index'
  end

  def render(template)
    react_component(template, {}, prerender: true)
  end
end

if __FILE__ == $0
    UsersController.run!
  end