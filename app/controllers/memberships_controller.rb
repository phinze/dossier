class MembershipsController < InheritedResources::Base
  respond_to :html

  belongs_to :community
end

