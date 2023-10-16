class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # Associations
  has_many :entities

  # Attributes
  attribute :name, :string

  # Validations
  validates :name, presence: :true, length: { maximum: 100 }

  # Methods

  # Callbacks

end
