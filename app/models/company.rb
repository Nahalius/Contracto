class Company < ActiveRecord::Base

  has_many :users
  has_many :clients
  has_many :contacts
  has_many :surveys

  validates :name, presence: true,
  length: { maximum: 100 },
  uniqueness: { case_sensitive: false }

  default_scope -> { order('name DESC') }


end
