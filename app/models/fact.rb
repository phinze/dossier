class Fact < ActiveRecord::Base
  belongs_to :membership
  belongs_to :facet

  acts_as_list scope: :membership
end
