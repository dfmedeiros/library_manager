class StudentsController < ApplicationController

  respond_to :html, :json
  
  def index
    params[:search] = {:full_name => params[:term]} if params[:term].present?
    @students = if params[:search].present?
      Student.search_by_full_name_and_registration(params[:search])
    else
      Student.all
    end
    respond_with @students
  end

  def show
    @student = Student.find(params[:id])
  end

end