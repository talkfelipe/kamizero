class NotesController < ApplicationController

  def index
    if current_user.role == "teacher"
      @notes = current_user.notes
    else
      @notes = current_user.children_notes
    end
  end

  def show
    @note = Note.find(params[:id])
  end

  def new

  end

  def create

  end

  def update

  end
end
