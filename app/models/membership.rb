class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :community

  has_many :facts, -> { order :position }
end
