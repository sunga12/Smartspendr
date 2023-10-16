class Group < ApplicationRecord
  
  # Associations
  has_many :entity_groups
  has_many :entities, through: :entity_groups

  # Attributes
  attribute :name, :string
  attribute :icon, :string

  # Validations
  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true


  # Methods

  # Callbacks


end
