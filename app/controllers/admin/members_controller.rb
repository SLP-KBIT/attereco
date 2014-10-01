class Admin::MembersController < ApplicationController
  before_action :sign_in_required, :admin_required

  def index
    @members = Member.all
    @attend = Attend.new
  end

  def edit
    @member = Member.where(id: params[:id]).first
  end

  def update
    @member = Member.where(id: params[:id]).first
    @member.update_attributes(member_params)
    redirect_to edit_admin_member_path(@member)
  end

  private

  def member_params
    params.require(:member).permit(:name, :account, :grade, :student_number, :password, :password_confirmation)
  end
end
