class PagesController < ApplicationController

  layout 'navbar'

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new()
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:message] = "Page created successfully!!"
      redirect_to(pages_path)
    else
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      flash[:message] = "Page updated successfully!!"
      redirect_to(page_path(@page))
    else
      render('edit')
    end
  end

  def delete
    @page = Page.find(params[:id])
    render('delete')
  end

  def destroy
    @page = Page.find(params[:id])
    if @page.destroy
      flash[:message] = "Page deleted successfully!!"
      redirect_to(pages_path)
    else
      render('delete')
    end
  end

  def page_params
    params.require(:page).permit(:name, :subject_id, :position, :permalink, :visible)
  end
end
