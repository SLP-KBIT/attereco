class AttendsController < ApplicationController
  before_action :sign_in_required

  def index
    @attends = Attend.order("date DESC")
  end
end
