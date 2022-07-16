class SubjectsController < ApplicationController


  def index
  @subjects = Subject.sorted
  render 'index'
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new(name: "default name") #In new() method we can define the default values for fields
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
      redirect_to(subjects_path)
    else
      # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    # Find a new object using form parameters
    @subject =  Subject.find(params[:id])
    # Update the object
    if @subject.update(subject_params)
      # If save succeeds, redirect to the show action
      redirect_to(subject_path(@subject))
    else
      # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
  end

  def destroy
    @subject = Subject.find(params[:id])
    if @subject.destroy
      redirect_to(subjects_path)
    else
      render('index')
    end
  end

  #STRONG params
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
