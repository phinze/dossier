class CommunitiesController < InheritedResources::Base
  respond_to :html
  before_filter :authenticate_user!

  def create
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
