class Client < ActiveRecord::Base
  belongs_to :company
  has_many  :agreemnts
  validates :company_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
end
