class Facet < ActiveRecord::Base
  belongs_to :community
  has_many :facts
end
