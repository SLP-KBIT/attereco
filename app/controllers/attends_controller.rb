class AttendsController < ApplicationController
  before_action :sign_in_required

  def index
    @attends = Attend.order("date")
  end
  
end
