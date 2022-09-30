# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :set_team, only: [:edit]

  def index
    @team = current_user.teams.order('created_at DESC')
  end

  def show; end

  def new
    @team = current_user.teams.build
    @user = current_user
  end

  def edit; end

  def create
    @team = current_user.teams.new(team_params)
    @team.users << current_user
    if @team.save
      redirect_to teams_path, flash: { notice: 'Team Created' }
    else
      render :new
    end
  end

  def update
    @team = set_team
    if current_user.teams.update(@team.id, team_params)
      redirect_to teams_path @team, flash: { notice: 'Team Updated.' }
    else
      render :edit
    end
  end

  def destroy
    @team = set_team
    @user = current_user
    if @user.teams.destroy(@team.id)
      redirect_to teams_path, flash: { notice: 'Team Deleted' }
    else
      render :index
    end
  end


  # private methods

  private

  # using callbacks to use common setup and constraints between actions
  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, users_attributes: %i[id name email _destroy])
  end
end
