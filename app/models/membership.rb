class Membership < ActiveRecord::Base
  belongs_to :user
  belongs_to :community

  has_many :facts, -> { 
    order(:position).joins(:facet)
  }

  def email
    user.email
  end

  FACETS = %w[
    avatar
    bio
    title
    department
    twitter
    facebook
    github
    phone
  ]

  FACETS.each do |key|
    define_method(key) { value_for(key) }
  end

  def value_for(name)
    (facts.where(facets: {name: name}).first || NullFact.new).value
  end
end
