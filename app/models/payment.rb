class Payment < ActiveRecord::Base
  belongs_to :agreemnt
  validates :agreemnt_id, presence: true
  validates :amount, presence: true
end
