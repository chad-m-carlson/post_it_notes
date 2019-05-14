class NotesController < ApplicationController
  def index
    @notes = Note.all
  end

  def show
    @show_note = Note.find(params[:id])
  end

  def new
    @new_note = Note.new
  end

  def create
    @new_note = Note.new(params.require(:note).permit(:title, :due, :body))

    if @new_note.save
      redirect_to notes_path
    else 
      renders :new
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    if @note.update(params.require(:note).permit(:title, :due, :body))
      redirect_to notes_path
    else
      renders :edit
    end
  end
  
  def destroy
    Note.find(params[:id]).destroy
    redirect_to notes_path
  end
end
