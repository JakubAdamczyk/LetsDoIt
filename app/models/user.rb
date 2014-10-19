class User < ActiveRecord::Base
  has_many :lists
  has_many :tasks, through: :lists

  validates :name, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
end
