class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts

  validates :username, presence: true, length: {maximum: 10}
  validates :full_name, length: {maximum: 20}
  validates :facebook_url, length: {maximum: 40}
  validates :twitter_url, length: {maximum: 40}
  validates :instagram_url, length: {maximum: 40}


end
