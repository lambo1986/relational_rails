class MusiciansController < ApplicationController
  def index
    @musicians = Musician.all
  end

  def show
    @musician = Musician.find(params[:id])
  end

  def new
  end

  def edit
    @musician = Musician.find(params[:id])
  end

  def update
    musician = Musician.find(params[:id])
    musician.update(musician_params)
    redirect_to '/musicians'
  end

  def create
    musician = Musician.create!(musician_params)
    redirect_to "/musicians"
  end

  private
  def musician_params
    params.permit(:name, :age, :genre, :active)
  end
end
