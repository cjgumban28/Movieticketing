class ScreensController < ApplicationController
  def index
    @screens = Screen.all
  end

  def show
    @screen = Screen.find(params[:id])
  end
end
