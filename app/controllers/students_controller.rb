class StudentsController < ApplicationController
  def new
    @student = current_user.children.new
    if params[:name].present?
      @student.name = params[:name]
    end

    if params[:school_id].present?
      @student.school_id = params[:school_id]
    end

    @selected_grade = params[:grade]
    @selected_classroom = params[:classroom]
  end

  def create
    @student = Student.new(student_params)
    @classroom = Classroom.find_by(school: @student.school, grade: classroom_params[:grade], name: classroom_params[:name])
    @user = current_user
    @student.user = @user
    @student.classroom = @classroom
    if @student.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def student_params
    params.require(:student).permit(:school_id, :name)
  end

  def classroom_params
    params.require(:classroom).permit(:grade, :name)
  end
end
