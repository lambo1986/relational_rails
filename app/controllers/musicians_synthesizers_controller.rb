class MusiciansSynthesizersController < ApplicationController
  def index
    @musician = Musician.find(params[:musician_id])
    @synthesizers = @musician.synthesizers
  end

  def new
    @musician = Musician.find(params[:id])
  end

  def sorted
    @musician = Musician.find(params[:id])
    @synthesizers = @musician.synthesizers.order(:brand)
    # redirect_to("/musicians/#{@musician.id}/synthesizers/sorted")
  end

  def create
    musician = Musician.find(params[:id])
    synthesizer = musician.synthesizers.create!(synth_params)
    redirect_to "/musicians/#{synthesizer.musician_id}/synthesizers/"
  end

  # def destroy
  #   synthesizer = Synthesizer.find(params[:id])
  #   synthesizer.destroy
  #   redirect_to "/synthesizers"
  # end

  private
  def synth_params
    params.permit(:brand, :name, :year, :engine, :value, :voice_count, :vintage)
  end
end
