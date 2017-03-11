class Survey < ActiveRecord::Base
  belongs_to :company
  validates :company_id, presence: true
  validates :name, presence: true, length: { maximum: 340 }
  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions
  
end
