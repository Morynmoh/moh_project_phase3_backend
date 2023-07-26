class User < ActiveRecord::Base
    validates :user_name, presence: true, uniqueness: true
    validates :password, presence: true
end