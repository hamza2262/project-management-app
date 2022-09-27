# frozen_string_literal: true

class MembersController < ApplicationController
  before_action :set_member, only: [:edit]
  before_action :set_team, only: [:edit]

  def index
    @team = Team.find(params[:team_id])
    @member = @team.members.order('created_at DESC')
  end

  # def show; end

  def new
    @team = Team.find(params[:team_id])
    @member = @team.members.new
  end

  def edit; end

  def create
    @team = Team.find(params[:team_id])
    @member = @team.members.new(member_strong_params)
    @member.user_id = current_user.id
    if @member.save
      redirect_to team_members_path(@team), flash: { notice: 'Member Created' }
    else
      redirect_to new_team_member_path
    end
  end

  def update
    @team = Team.find(params[:team_id])
    @member = member_params
    @member.user_id = current_user.id
    if @team.members.update(@member.id, member_strong_params)
      redirect_to team_members_path(@team), flash: { notice: 'Member Updated' }
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:team_id])
    @member = member_params
    @member.user_id = current_user.id
    if @team.members.destroy(@member.id)
      redirect_to team_members_path(@team), flash: { notice: 'Member Deleted' }
    else
      render :index
    end
  end

  private

  def set_member
    @member = Member.find(params[:id])
  end

  def set_team
    @team = Team.find(params[:team_id])
  end

  def member_params
    @member = Member.find(params[:id])
  end

  def member_strong_params
    params.require(:member).permit(:member_name, :member_email)
  end
end
