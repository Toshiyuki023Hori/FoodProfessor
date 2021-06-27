class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :folder

  validates :user_id, presence: true
  validates :folder_id, presence: true
  validates :recipe_name, { presence: true, length: { maximum: 50 } }
end
