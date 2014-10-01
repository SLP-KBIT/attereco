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
    @members = Member.select { |member|  member.status == Member::Status::InRoom }
  end

  def create
    @member = Member.where(id: params[:attend][:member_id]).first
    next_status = @member.next_status
    @attend = @member.attends.build(log_at: 1, date: Time.now, status: next_status)
    @attend.save!
    if current_member.id == @member.id
      redirect_to root_path
    else
      redirect_to admin_members_path
    end
  end

  def search
    date = params[:date].gsub(/\./, "-")
    @attends = Attend.date_is(date)
    render "index"
  end
end
