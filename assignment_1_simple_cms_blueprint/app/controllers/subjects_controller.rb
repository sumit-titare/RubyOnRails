class SubjectsController < ApplicationController

  layout('navbar')

  def index
  @subjects = Subject.sorted
  render 'index'
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(name: "default name") #In new() method we can define the default values for fields
    @subjects_count = Subject.count + 1
  end

  def create
    # Instantiate a new object using form parameters

    # @subject = Subject.new(params[:subject])
    #This gives #ActiveModel::ForbiddenAttributesError in SubjectsController#create
    #Because, in RAILS 3 and above : MASS update of attributes is not allowed by default , You have to permit the attributes which you want to update explicitly.
    #These are called STRONG PARAMS.

    @subject = Subject.new(subject_params)

    # Save the object
    if @subject.save
      # If save succeeds, redirect to the index action
      flash[:message] = "#{@subject.name} created successfully!!"
      redirect_to(subjects_path)
    else
      # If save fails, redisplay the form so user can fix problems
      @subjects_count = Subject.count + 1
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
    @subjects_count = Subject.count
  end

  def update
    # Find a new object using form parameters
    @subject =  Subject.find(params[:id])
    # Update the object
    if @subject.update(subject_params)
      # If save succeeds, redirect to the show action
      flash[:message] = "#{@subject.name} updated successfully!!"
      redirect_to(subject_path(@subject))
    else
      # If save fails, redisplay the form so user can fix problems
      @subjects_count = Subject.count
      render('edit')
    end
  end

  def delete
    @subject = Subject.find(params[:id])
  end

  def destroy
    @subject = Subject.find(params[:id])
    if @subject.destroy
      flash[:message] = "#{@subject.name} destroyed successfully!!"
      redirect_to(subjects_path)
    else
      render('index')
    end
  end

  #STRONG params
  def subject_params
    params.require(:subject).permit(
      :name,
      :position,
      :visible)
  end

end
