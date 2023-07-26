class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  configure do
    enable :cross_origin
  end

  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end

  get "/users" do
    users = User.all 
    users.to_json
  end

  get "/expenses" do
    expenses = Expense.all 
    expenses.to_json
  end

  get "/categories" do
    categories = Category.all 
    categories.to_json
  end
  # post "/users" do
  #       user = User.create(params)
  #       if user.valid?
  #         { user: user, message: "User created successfully" }.to_json
  #       else
  #         { message: "User creation failed" }.to_json 
  #       end
  #     end

  post '/signin' do
    request_payload = JSON.parse(request.body.read)
    user = User.create(user_name: request_payload['user_name'], password: request_payload['password'])
      
    if user.valid?
      { user: user, message: "User created successfully" }.to_json
    else
       { message: "User creation failed" }.to_json
    end
  end

  post '/login' do
    user_name = params[:user_name]
    password = params[:password]
    user = User.find_by(user_name: user_name, password: password)
      
    if user
          # Authentication successful; Redirect to home page
      redirect '/Home'
    else
          # User not found; Return 404 status and error message
      status 404
      response_data = { error: 'User not found.' }
      response_data.to_json
      
    end
  end

      # post '/login' do
      #   user_name = params[:user_name]
      #   password = params[:password]
      #   user = User.find_by(user_name: user_name, password: password)
      #   if user
      #     user_name = user.user_name.split(' ').first.capitalize
      #     response_data = { id: user.id, user_name: user_name }
      #     response_data.to_json
      #   else
      #     status 404
      #     response_data = { error: 'User not found.' }
      #     response_data.to_json
      #   end
      # end

    # post '/expenses' do
    #   request_payload = JSON.parse(request.body.read)
    #   user = User.create(user_name: request_payload['user_name'], password: request_payload['password'])
    
    #   if user.valid?
    #     { user: user, message: "User created successfully" }.to_json
    #   else
    #     { message: "User creation failed" }.to_json
    #   end
    # end

  post '/expenses' do
    request_payload = JSON.parse(request.body.read)
    
    expense = Expense.create(
      description: request_payload['description'],
      date: request_payload['date'],
      amount: request_payload['amount']
    )
    
    if expense.valid?
      { expense: expense, message: "Expense created successfully" }.to_json
    else
      { message: "Expense creation failed" }.to_json
    end
  end


  post '/categories' do
    request_payload = JSON.parse(request.body.read) rescue {}
  
    category = Category.create(
      name: request_payload['name']
    )
  
    if category.valid?
      { category: category, message: "Category created successfully" }.to_json
    else
      { message: "Category creation failed" }.to_json
    end
  end
  # post '/categories' do
  #   request_payload = JSON.parse(request.body.read)
  
  #   category = Category.create(
  #     name: request_payload['name']
  #   )
  
  #   if category.valid?
  #     { category: category, message: "Category created successfully" }.to_json
  #   else
  #     { message: "Category creation failed" }.to_json
  #   end
  # end
end
    
  

