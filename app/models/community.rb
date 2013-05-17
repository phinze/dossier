class Community < ActiveRecord::Base
  validates :name, :url, presence: true

  has_many :memberships
  has_many :users, through: :memberships

  def add_member(user)
    users << user
    save
  end
end
