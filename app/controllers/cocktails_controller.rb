class CocktailsController < ApplicationController
  def index
    if params[:search].blank?
      @cocktails = Cocktail.all
    else
      @parameter = params[:search].downcase
      @cocktails = Cocktail.all.where(
        'lower(name) LIKE :search', search: @parameter
      )
    end
    # if params[:search].nil?
    # else
    #   @cocktails = Cocktail.where(name: params[:search])
    # end
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
    params.require(:cocktail).permit(:name, :photo, :url)
  end
end
