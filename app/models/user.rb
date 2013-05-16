class User < ActiveRecord::Base
  attr_accessible :full_name, :login, :email
end
