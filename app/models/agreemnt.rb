class Agreemnt < ActiveRecord::Base
  belongs_to :client
  validates :client_id, presence: true
  validates :name, presence: true, length: { maximum: 140 }
  has_many :invoices, dependent: :destroy
  has_many :payments, dependent: :destroy

end
