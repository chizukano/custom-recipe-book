class Recipe < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients, dependent: :destroy
  has_one_attached :photo

  accepts_nested_attributes_for :ingredients,
                                reject_if: :all_blank,
                                allow_destroy: true
  accepts_nested_attributes_for :recipe_ingredients,
                                reject_if: :all_blank,
                                allow_destroy: true
end
