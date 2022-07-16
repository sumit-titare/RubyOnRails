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
  end

  def delete
  end

  #STRONG params
  def subject_params
    params.require(:subject).permit(:name, :position, :visible)
  end

end
