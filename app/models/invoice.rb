class Invoice < ActiveRecord::Base
  belongs_to :agreemnt

  validates :number, presence: true,
  length: { maximum: 10},
  uniqueness: { case_sensitive: false }

  validates :date, presence: true
  


end
