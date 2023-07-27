class Expense < ActiveRecord::Base
    belongs_to :user 
    belongs_to :category 
    validates :description, :date, :amount, :category_id, presence: true
      
end


