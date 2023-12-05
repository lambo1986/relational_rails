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

    redirect_to "/musicians/#{musician.id}"
  end

  def sort_by_synth_count
    @musicians = Musician.all.sort_by {|musician| musician.synthesizers.count}.reverse
  end

  # def update_from_show_page
  #   musician = Musician.find(params[:id])
  #   musician.update(musician_params)
  #   redirect_to "/musicians/#{musician.id}"
  # end

  def create
    musician = Musician.create!(musician_params)
    redirect_to("/musicians")
  end

  def destroy
    musician = Musician.find(params[:id])
    musician.destroy
    redirect_to("/musicians")
  end

  private
  def musician_params
    params.permit(:name, :age, :genre, :active)
  end
end
