class Position < ApplicationRecord
  belongs_to :company
  has_many :applicants

  enum career: [ :developer, :business_inteligence, :information_technology,
                 :design, :product, :technology, :other ]
  enum contract: [ :clt, :pj, :both ]

  validates :name, :career, :contract, :city,
            :state, :summary, :description, presence: true

  has_rich_text :description

  before_save :set_slug

  private

  def set_slug
    self.slug = "#{self.company.name.parameterize}-#{self.name.parameterize}"
  end
end
