class Category < ApplicationRecord
    belongs_to :user
    belongs_to :expense
    validates :category, presence: true
  end