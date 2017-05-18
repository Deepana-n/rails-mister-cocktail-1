class CocktailsController < ApplicationController
  before_action :set_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
    url = 'http://www.thecocktaildb.com/api/json/v1/1/filter.php?a=Alcoholic'
    cocktails_serialized = open(url).read
    cocktails = JSON.parse(cocktails_serialized)
    @pics = []

    cocktails["drinks"].each do |cocktail|
      if cocktail["strDrinkThumb"]
        @pics << cocktail["strDrinkThumb"]
      end
      # url de pic => @pics[rand(@pics.size)]
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    @dose = Dose.new
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def cocktail_params
    params.require(:cocktail).permit(:name)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:id])
  end
end
