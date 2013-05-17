class CommunitiesController < InheritedResources::Base
  respond_to :html

  def create
    @community = Community.new(permitted_params)
    create! { communities_path }
  end

  def update
    update! { communities_path }
  end

  private

  def permitted_params
    params.permit community: [:name, :url]
  end
end
