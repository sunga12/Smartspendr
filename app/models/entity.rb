class Entity < ApplicationRecord
  
  # Associations
  belongs_to :user, class_name: "User", foreign_key: "author_id"
  belongs_to :group

  # Attributes
  attribute :name, :string
  attribute :amount, :float

  # Validations
  validates :name, presence: true, length: { maximum: 250 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0}


  # Methods

  # Callbacks


end
