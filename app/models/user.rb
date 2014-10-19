class User < ActiveRecord::Base

  after_create :create_list

  has_many :lists
  has_many :tasks, through: :lists

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def create_list
    self.lists.create(name: List::DEFAULT_NAME)
  end
end
