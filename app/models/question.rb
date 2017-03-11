class Question < ActiveRecord::Base
  belongs_to :survey
  validates :question, presence: true, length: { maximum: 540 }
end
