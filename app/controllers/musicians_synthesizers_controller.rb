class MusiciansSynthesizersController < ApplicationController
  def index
    @musician = Musician.find(params[:musician_id])
    @synthesizers = @musician.synthesizers
  end

  def new
    @musician = Musician.find(params[:id])
  end

  def create
    musician = Musician.find(params[:id])
    synthesizer = musician.synthesizers.create!(synth_params)
    redirect_to "/musicians/#{synthesizer.musician_id}/synthesizers/"
  end

  private
  def synth_params
    params.permit(:brand, :name, :year, :engine, :value, :voice_count, :vintage)
  end
end
