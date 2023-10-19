class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  # Associations
  has_many :entities, foreign_key: 'author_id', dependent: :destroy
  has_many :groups, foreign_key: 'author_id', dependent: :destroy

  # Attributes
  attribute :name, :string

  # Validations
  validates :name, presence: :true, length: { maximum: 100 }
  validates :email, presence: :true, uniqueness: true, length: { maximum: 150 }

  # Methods

  # Callbacks

end
