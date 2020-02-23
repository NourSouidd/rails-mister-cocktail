class CocktailsController < ApplicationController

  def search
    @cocktail = Cocktail.where(name: params[:search])
  end

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(secure_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  private

  def secure_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
