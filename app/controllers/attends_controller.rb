class AttendsController < ApplicationController
  before_action :sign_in_required

  def index
    @attends = Attend.order("date DESC")

    respond_to do |format|
      format.html
      format.json {render json: @attends}
    end
  end

  def new
    @attend = Attend.new
    @members = Member.where(status: Member::Status::InRoom)
  end

  def create
    @attend = current_member.attends.build(log_at: 1, date: Time.now)
    current_member.change_status
    current_member.save!
    @attend.status = current_member.status
    @attend.save!
    redirect_to root_path
  end

  def search
    date = params[:date].gsub(/\./, "-")
    @attends = Attend.date_is(date)
    render "index"
  end

  private

  # def attend_params
  #   params.require(:attend).permit()
  # end
end
