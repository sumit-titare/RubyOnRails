class SectionsController < ApplicationController

  layout('navbar')
  before_action :find_page
  before_action :confirm_logged_in

  def index
    @sections = @page.sections.sorted
  end

  def new
    @section = Section.new(visible: false, page_id: @page.id)
    @sections_count = Section.count + 1
    @pages_lookup = Page.all.map { |p| [p.name, p.id]}
  end

  def create
    @section = Section.new(section_params)
    if @section.save
      flash[:message] = "Section created successfully!!"
      redirect_to(sections_path(page_id: @page.id))
    else
      @sections_count = Section.count + 1
      @pages_lookup = Page.all.map { |p| [p.name, p.id]}
      render('new')
    end
  end

  def show
    @section = Section.find(params[:id])
  end

  def edit
    @section = Section.find(params[:id])
    @sections_count = Section.count
    @pages_lookup = Page.all.map { |p| [p.name, p.id]}
  end

  def update
    @section = Section.find(params[:id])
    if @section.update(section_params)
      flash[:message] = "Section updated successfully!!"
      redirect_to(section_path(@section, page_id:@page.id))
    else
      @sections_count = Section.count
      @pages_lookup = Page.all.map { |p| [p.name, p.id]}
      render('edit')
    end
  end

  def delete
    @section = Section.find(params[:id])
    render('delete')
  end

  def destroy
    @section = Section.find(params[:id])
    if @section.destroy
      flash[:message] = "Section deleted successfully!!"
      redirect_to(sections_path(page_id: @page.id))
    else
      render('delete')
    end
  end

  def section_params
    params.require(:section).permit(
      :name,
      :page_id,
      :position,
      :visible,
      :content_type,
      :content)
  end

  private
  def find_page
    @page = Page.find(params[:page_id])
  end
end
