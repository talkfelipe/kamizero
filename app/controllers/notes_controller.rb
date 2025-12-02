class NotesController < ApplicationController
  before_action :set_student, only: [:new, :create]

  def index
    @notes = Note.all
  end

  def show
    @note = Note.find(params[:id])
  end

  def new
    @note = @student.notes.new
  end

  def create
    @note = @student.notes.new(note_params)
    if @note.save
      redirect_to note_path(@note), notice:"Message was successfully created"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update

  end

  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def note_params
    params.require(:note).permit(:title, :content, :reply)
  end

end
