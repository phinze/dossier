class Community < ActiveRecord::Base
  validates :name, :url, presence: true

  has_many :memberships
  has_many :users, through: :memberships


  def self.example
    where(name: 'Mushroom Kingdom').first
  end

  def add_member(user)
    membership = Membership.new(user: user, community: self)
    if membership.save
      self.memberships << membership
      membership 
    else
      false
    end
  end
end
