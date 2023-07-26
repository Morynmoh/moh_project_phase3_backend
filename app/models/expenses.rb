class Expense < ActiveRecord::Base
    belongs_to :user
    validates :description, :date, :amount, presence: true
  
end