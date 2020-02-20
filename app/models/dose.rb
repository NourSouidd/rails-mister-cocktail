class Dose < ApplicationRecord
  belongs_to :cocktail
  belongs_to :ingredient
  # validates :user_id, uniqueness: { scope: [:question_id] }
  validates_uniqueness_of :cocktail_id, scope: [:ingredient_id]
  validates :description, presence: true
end
