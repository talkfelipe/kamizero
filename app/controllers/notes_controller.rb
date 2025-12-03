class NotesController < ApplicationController
  before_action :set_student, only: [:new, :create]

  def index
    if current_user.role == "teacher"
      @notes = current_user.notes
    else
      @notes = current_user.children_notes
      @students_for_dropdown = current_user.children
    end

    @notes = @notes.order(created_at: :desc)

  end

  def show
    @note = Note.find(params[:id])
  end

  def mark_as_read
    note = Note.find(params[:id])
    # For those who read the show page will change the status to true.
    # Used find_or_initialize_by in order to avoid having multiple action of
    # status = true by looking at same show page several times
    read = ReadNotification.find_or_initialize_by(
      user: current_user,
      notification: note
    )
    read.status = true
    read.save!

    respond_to do |format|
      format.json { head :no_content }
      format.html { redirect_to note_path(note) } # 念のため
    end

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
    @note = Note.find(params[:id])

    # If a reply already exists, do nothing and just show the note
    if @note.reply.present?
      redirect_to note_path(@note)
      return
    end

    # Only teachers are allowed to reply
    unless current_user.role == "teacher"
      redirect_to note_path(@note)
      return
    end

    # First (and only) reply
    if @note.update(note_params)
      redirect_to note_path(@note), notice: "Reply was successfully saved."
    else
      render :show, status: :unprocessable_entity
    end
  end



  private

  def set_student
    @student = Student.find(params[:student_id])
  end

  def note_params
    params.require(:note).permit(:reply)
  end

end
