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
  
  def create
    @project = Project.find params[:project_id]
    @entry = @project.entries.new entry_params

    if @entry.save
      redirect_to action: 'index', controller: 'entries', project_id: @project.id
    else
      render 'new'
    end
  end
  
  private
  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end
end
