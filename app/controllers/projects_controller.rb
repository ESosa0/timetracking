class ProjectsController < ApplicationController
  def index
    @projects = Project.order(created_at: :desc).limit(10)
  end
  def show
    @project = Project.find params[:id]
    rescue ActiveRecord::RecordNotFound
    render 'no_projects_found'
  end
end

