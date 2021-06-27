class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :folder

  validates :recipe_name, { presence: true, length: { maximum: 50 } }
end
