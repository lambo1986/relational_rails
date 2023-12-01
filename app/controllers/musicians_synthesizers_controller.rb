class MusiciansSynthesizersController < ApplicationController
  def index
    @musician = Musician.find(params[:musician_id])
    @synthesizers = @musician.synthesizers
  end
end
