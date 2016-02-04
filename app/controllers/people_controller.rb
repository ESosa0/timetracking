class PeopleController < ApplicationController

  def index
    @people = Person.all
  end

  def show
    @person = Person.find(params[:id])
    @available_projects = @person.projects
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new
    if @person.save
      flash[:notice] = "Person successfully created"
      redirect_to person_path(@person)
    else
      flash[:alert] = "Person not saved"
      render 'new'
    end
  end

  def associate_project
    @person = Person.find params[:id]
    @project = Project.find params[:project_id]
  end

  private
  def person_params
    params.require(:person).permit(:name, :email)
  end

end
