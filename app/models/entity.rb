class Entity < ApplicationRecord
  
  # Associations
  belongs_to :user, class_name: "user", foreign_key: "user_id"
  has_many :entity_groups
  has_many :groups, through: :entity_groups

  # Attributes
  attribute :name, :string
  attribute :amount, :float

  # Validations
  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0, only_float: true }


  # Methods

  # Callbacks


end
