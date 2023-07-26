class Expense < ActiveRecord::Base
    belongs_to :user
    validates :description, :date, :amount, presence: true
    
  
end

# class Expense
#     include DataMapper::Resource
  
#     property :id, Serial
#     property :description, String
#     property :date, Date
#     property :amount, Float
#   end
