class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :communities, through: :memberships

  validates :full_name, presence: true
  validates :short_name, presence: true

  def display
    full_name
  end

  def avatar
    memberships.first.avatar
  end
end
