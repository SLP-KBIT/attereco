class AttendsController < ApplicationController
  before_action :sign_in_required

  def index
    @attends = Attend.all

    respond_to do |format|
      format.html
      format.json {render json: @attends}
    end
  end

  def new
    @attend = Attend.new
  end

  def search
    date = params[:date].gsub(/\./, "-")
    @attends = Attend.where(date: date)
    render "index"
  end
end
