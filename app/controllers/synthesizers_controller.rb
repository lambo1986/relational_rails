class SynthesizersController < ApplicationController
  def index
    @synthesizers = Synthesizer.all
  end

  def show
    @synthesizer = Synthesizer.find(params[:id])
  end
end
