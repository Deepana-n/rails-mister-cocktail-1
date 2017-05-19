class Cocktail < ApplicationRecord
  PICS = CocktailScraper.new.pics
  has_attachments :photos, maximum: 2
  has_many :ingredients, through: :doses
  has_many :doses, dependent: :destroy
  validates :name, presence: true, uniqueness: true
end
