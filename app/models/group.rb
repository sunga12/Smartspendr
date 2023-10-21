class Group < ApplicationRecord
  # Associations
  belongs_to :user, class_name: 'User', foreign_key: 'author_id'
  has_and_belongs_to_many :entities, dependent: :destroy
  has_one_attached :icon


  # Attributes
  attribute :name, :string
  attribute :icon, :string

  # Validations
  validates :name, presence: true, length: { maximum: 250 }
  validates :icon, presence: true


  # Methods

  # Callbacks
end
