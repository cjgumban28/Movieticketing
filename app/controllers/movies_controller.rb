class MoviesController < ApplicationController
  def index
    # ----------- not for use ------------
    # # @movies =Movie.all
    # @movie = Movie.released_before
  end

  def show
    @movie= Movie.find(params[:id])
  end

  def new
    @movie =Movie.new
  end
end
