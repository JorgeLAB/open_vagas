class HomeController < ApplicationController
  def index
    @positions = Position.page(params[:page]).per(params[:per])
  end
end
