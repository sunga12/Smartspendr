class User < ApplicationRecord

  # Associations
  has_many :entities

  # Attributes
  attribute :name, :string

  # Validations
  validates :name, presence: :true, length: { maximum: 100 }

  # Methods

  # Callbacks

end
