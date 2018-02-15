require 'open-uri'

class CocktailScraper
  def pics
    url = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'
    cocktails_serialized = open(url).read
    cocktails = JSON.parse(cocktails_serialized)
    pics = []

    cocktails["drinks"].each do |cocktail|
      if cocktail["strDrinkThumb"]
        pics << cocktail["strDrinkThumb"]
      end
      # url de pic => @pics[rand(@pics.size)]
    end
    pics
  end
end
