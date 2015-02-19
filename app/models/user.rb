class User < ActiveRecord::Base
  resourcify
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :user_businesses
  has_many :businesses, through: :user_businesses
  has_many :event_users
  has_many :events, through: :event_users


  #has_and_belongs_to_many :roles, :join_table => :users_roles
end
