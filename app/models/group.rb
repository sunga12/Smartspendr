class Group < ApplicationRecord
  
  # Associations
  belongs_to :user, class_name: "User", foreign_key: "author_id"
  has_many :entities, dependent: :destroy


  # Attributes
  attribute :name, :string
  attribute :icon, :string

  # Validations
  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true


  # Methods

  # Callbacks


end
