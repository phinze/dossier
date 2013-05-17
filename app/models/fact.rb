class Fact < ActiveRecord::Base
  belongs_to :membership
  belongs_to :facet
  belongs_to :author, class_name: 'User'

  acts_as_list scope: :membership
end
