class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :position

  validates :email, presence: true
end
