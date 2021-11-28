class Position < ApplicationRecord
  belongs_to :company

  enum career: [ :developer, :business_inteligence, :information_technology,
                 :design, :product, :technology, :other ]
  enum contract: [ :clt, :pj, :both ]

  validates :name, :career, :contract, :city,
            :state, :summary, :description, presence: true

  has_rich_text :description
end
