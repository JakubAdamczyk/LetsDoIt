class List < ActiveRecord::Base
  belongs_to :user
  has_many :tasks

  validates :name, presence: true

  DEFAULT_NAME = "Default List"
end
