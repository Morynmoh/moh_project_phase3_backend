class User < ActiveRecord::Base
    validates_presence_of :password, :user_name
    validates_uniqueness_of :password, :user_name
end