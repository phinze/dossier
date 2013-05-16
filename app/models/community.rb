class Community < ActiveRecord::Base
  validates :name, :url, presence: true
end
