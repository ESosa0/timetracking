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
      flash[:notice] = "Entry created successfully"
      redirect_to action: 'index', controller: 'entries', project_id: @project.id
    else
      render 'new'
    end
  end

  def edit
    @project = Project.find params[:project_id]
    @entry = @project.entries.find params[:id]
  end

  def update
    @project = Project.find params[:project_id]
    @entry = @project.entries.find params[:id]
    if @entry.update_attributes entry_params
      redirect_to action: 'index'
    else
      render 'new'
    end
  end

  def destroy
    @project = Project.find params[:project_id]
    @entry = @project.entries.find params[:id]
    @entry.destroy
    flash[:alert] = "Entry has been deleted"
    redirect_to project_entries_path(@project)
  end

  
  private
  def entry_params
    params.require(:entry).permit(:hours, :minutes, :date)
  end

end
