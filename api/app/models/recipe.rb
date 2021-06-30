class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :folder
  has_many :recipe_category_relations
  has_many :purposes
  has_many :comments

  validates :user_id, presence: true
  validates :folder_id, presence: true
  validates :recipe_name, { presence: true, length: { maximum: 50 } }
end
