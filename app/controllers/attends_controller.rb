class AttendsController < ApplicationController
  before_action :sign_in_required

  def index
    @attends = Attend.order(date: :desc)

    respond_to do |format|
      format.html
      format.json {render json: @attends}
    end
  end

  def new
    @members = Member.in_room
  end

  def create
    next_status = current_member.next_status
    @attend = current_member.attends.build(log_at: 1, date: Time.now, status: next_status)
    @attend.save!
    redirect_to root_path
  end

  def search
    date = params[:date].gsub(/\./, "-")
    @attends = Attend.date_is(date)
    render "index"
  end
end
