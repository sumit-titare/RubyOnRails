class PagesController < ApplicationController

  layout 'navbar'

  before_action :define_subjects_lookup, only: [:new, :create, :edit, :update ]
  before_action :set_page_count, only: [:new, :create, :edit, :update]

  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new()
    @pages_count = Page.count + 1
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      flash[:message] = "Page created successfully!!"
      redirect_to(pages_path)
    else
      # if it fails ,then template 'new' should have access to @pages_count, @subjects_lookup
      @pages_count = Page.count + 1
      render('new')
    end
  end

  def edit
    @page = Page.find(params[:id])
    @pages_count = Page.count
  end

  def update
    @page = Page.find(params[:id])
    if @page.update(page_params)
      flash[:message] = "Page updated successfully!!"
      redirect_to(page_path(@page))
    else
      @pages_count = Page.count
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
    params.require(:page).permit(
      :name,
      :subject_id,
      :position,
      :permalink,
      :visible)
  end

  ###
  private

  def define_subjects_lookup
      @subjects_lookup = Subject.sorted.map { |s| [s.name, s.id] }
  end

#For Action 'new' and 'create', we need @pages_count = Page.count + 1 ->(for new page)
  def set_page_count
    @pages_count = Page.count
    if params[:action] == 'new' || params[:action] == 'create'
      @pages_count += 1
    end
  end
end
