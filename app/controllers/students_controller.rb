class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    @student = Student.find_by(id: params[:id])
  end

  def activate
    @student = Student.find_by(id: params[:id])

    @student.active ? @student.active = false : @student.active = true
    @student.save

    redirect_to student_path(@student.id)
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end