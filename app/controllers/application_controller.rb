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
  # delete '/users' do
  #   user = User.all
  #   user.destroy

  #   response = { message: "User deleted successfully" }.to_json
  # end

  get "/users/:id" do
    user = User.find(params[:id]) 
    user.to_json
  end

  get "/categories/:id" do
    category = Category.find(params[:id]) 
    category.to_json
  end
  get "/expenses/:id" do
    expense = Expense.find(params[:id]) 
    expense.to_json
  end

  get "/expenses" do
    expenses = Expense.all 
    expenses.to_json
  end

  get "/categories" do
    categories = Category.all 
    categories.to_json
  end

  post '/register' do
        
      user = User.create(
        user_name: params[:user_name],
        password: params[:password],
      )
      response = { user: user, message: "User created successfully" }.to_json
    end

  post '/login' do
    user_name = params[:user_name]
    password = params[:password]
    user = User.find_by(user_name: user_name, password: password)
      
    if user
          # Authentication successful; Redirect to home page
      # redirect '/Home'
    else
          # User not found; Return 404 status and error message
      status 404
      response_data = { error: 'User not found.' }
      response_data.to_json
      
    end
  end

  post '/expenses' do
        
    expense = Expense.create(
      description: params[:description],
      date: params[:date],
      amount: params[:amount],
      user_id: params[:user_id],
      category_id: params[:category_id]

    )
    response = { expense: expense, message: "Expense created successfully" }.to_json
  end


  delete '/expenses/:id' do
    expense = Expense.find(params[:id])
    expense.destroy

    response = { message: "Expense deleted successfully" }.to_json
  end

  delete '/users/:id' do
    user = User.find(params[:id])
    user.destroy

    response = { message: "User deleted successfully" }.to_json
  end

 

  post '/categories' do
    # request_payload = JSON.parse(request.body.read) rescue {}
    
    category = Category.create(
      name: params[:name]
    )
    response = { category: category, message: "Category created successfully" }.to_json
  
  end
  
  delete '/expenses/:id' do
    expense = Expense.find(params[:id])
    expense.destroy

    response = { message: "Expense deleted successfully" }.to_json
  end

  delete '/category/:id' do
    category = Category.find(params[:id])
    category.destroy

    response = { message: "Category deleted successfully" }.to_json
  end

  # patch '/expenses/:id' do
  #   expense = Expense.find(params[:id])
      
  #   expense.description = params[:description]
  #   expense.amount = params[:amount]
  #   expense.date =  params[:date]
    
  #   expense.update
  #   expense.save

  #   response = { message: "Expense Updated successfully" }.to_json
    
  # end
  patch '/expenses/:id' do
    expense = Expense.find(params[:id])
  
    # Check if the description field is present in the request payload
    if params[:description]
      expense.description = params[:description]
    end
  
    # Check if the amount field is present in the request payload
    if params[:amount]
      expense.amount = params[:amount]
    end
  
    # Check if the date field is present in the request payload
    if params[:date]
      expense.date = params[:date]
    end
  
    # Save the expense
    expense.save
  
    # Return a success message
    response = { message: "Expense Updated successfully" }.to_json
  
    # Render the response
    render json: response
  end




end
    
  

