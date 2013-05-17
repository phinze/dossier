class Fact < ActiveRecord::Base
  belongs_to :membership
  belongs_to :facet, polymorphic: true

  acts_as_list scope: :membership
end
