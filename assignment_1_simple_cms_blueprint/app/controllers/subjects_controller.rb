class SubjectsController < ApplicationController


  def index
  @subjects = Subject.sorted
  render 'index'
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
  end

  def edit
  end

  def delete
  end
end
