# frozen_string_literal: true

class ProjectsController < ApplicationController
  def index
    @project = current_user.projects.order('created_at DESC')
  end

  def show; end

  def new
    @project = current_user.projects.new
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = current_user.projects.new(project_params)
    if @project.save
      redirect_to projects_path(@project.id), flash: { notice: 'Project Created' }
    else
      redirect_to projects_path
    end
  end

  def update
    @project = set_project
    @project = current_user.projects.update(@project.id, project_params)
    if @project.update(project_params)
      redirect_to projects_path(@project), flash: { notice: 'Project Updated' }
    else
      redirect_to projects_path
    end
  end

  def destroy
    @project = set_project
    @project = current_user.projects.destroy(@project.id)
    @user = current_user
    if @user.projects.destroy(@project)
      redirect_to projects_path, flash: { notice: 'Project Deleted' }
    else
      redirect_to projects_path
    end
  end

  private

  # using callbacks to use common setup and constraints between actions

  def set_new_project
    @user = current_user
  end

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:title, :description)
  end
end
