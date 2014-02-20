class User < ActiveRecord::Base
  has_many :projects
  has_many :tasks, through: :projects
  has_many :blocks, through: :tasks

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, email_format: true
end
