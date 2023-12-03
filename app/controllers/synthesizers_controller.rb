class SynthesizersController < ApplicationController
  def index
    @synthesizers = Synthesizer.all.where(vintage: true)
  end

  def show
    @synthesizer = Synthesizer.find(params[:id])
  end

  def edit
    @synthesizer = Synthesizer.find(params[:id])
  end

  def update
    synthesizer = Synthesizer.find(params[:id])
    synthesizer.update(synth_params)
    redirect_to "/synthesizers/#{synthesizer.id}/"
  end

  private
  def synth_params
    params.permit(:brand, :name, :year, :engine, :value, :voice_count, :vintage)
  end
end
