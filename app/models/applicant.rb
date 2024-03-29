require 'csv'

class Applicant < ApplicationRecord
  belongs_to :user
  belongs_to :position

  validates :email, presence: true
  has_one_attached :resume

  validate :correct_resume_mime_type

  def self.as_csv
    attributes = %w[id name email phone]

    ::CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |applicant|
        csv << attributes.map { |attr| applicant.send(attr) }
      end
    end
  end

  private

  def correct_resume_mime_type
    if resume.attached? && !resume.content_type.in?('application/pdf')
      errors.add(:resume, 'Você adicionou um tipo de arquivo errado!')
    end
  end
end
