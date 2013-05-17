class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :community

  has_many :facts, -> { 
    order(:position).joins(:facet)
  }

  def avatar
    facts.where(facets: {name: 'Avatar'}).first || NullFact.new
  end

  def bio
    facts.where(facets: {name: 'Bio'}).first || NullFact.new
  end

  def title
    facts.where(facets: {name: 'Title'}).first || NullFact.new
  end
end
