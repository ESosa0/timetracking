class EntriesController < ApplicationController
  def index
    @project = Project.find params[:project_id]
    # @entries = @project.entries
    @entries = @project.entries.where("created_at >= ? AND created_at <= ?", Date.today.beginning_of_month, Date.today.end_of_month)
  end
  def new
    @project = Project.find params[:project_id]
    @entry = @project.entries.new
  end
end
