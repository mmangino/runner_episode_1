class User < ActiveRecord::Base
  include FacebookerAuthentication::Model
  
  has_many :runs
end
