class TheatresController < ApplicationController
  def index
    @theatre = Theatre.all
  end

  def show
    @theatre = Theatre.find(params[:id])
  end
  
end
