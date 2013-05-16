class CommunitiesController < InheritedResources::Base
  respond_to :html

  def create
    super do |format|
      format.html { redirect_to communities_path }
    end
  end

  def update
    super do |format|
      format.html { redirect_to communities_path }
    end
  end

  private

  def permitted_params
    params.permit community: [:name, :url]
  end
end
