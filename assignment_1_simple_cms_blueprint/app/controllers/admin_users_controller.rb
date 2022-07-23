class AdminUsersController < ApplicationController

  layout 'navbar'
  before_action :confirm_logged_in, except:[:new, :create]

  def index
    @admin_users = AdminUser.sorted
  end

  def new
    @admin_user = AdminUser.new
  end

  def create
    @admin_user = AdminUser.new(admin_params)
    if @admin_user.save
      flash[:message] = "User created succesfully!!"
      redirect_to(admin_users_path) if session[:user_id]
      redirect_to(root_path)
    else
      render('new')
    end
  end

  def edit
    @admin_user = AdminUser.find(params[:id])
  end

  def update
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.update(admin_params)
      flash[:message] = "User updated succesfully!!"
      redirect_to(admin_users_path)
    else
      render('edit')
    end
  end

  def delete
    @admin_user = AdminUser.find(params[:id])
  end

  def destroy
    @admin_user = AdminUser.find(params[:id])
    if @admin_user.destroy
      flash[:message] = "User entry deleted successfully!"
      redirect_to(admin_users_path)
    else
      flash.now[:message] = "Something went wrong!"
      render('delete')
    end
  end

  def admin_params
    params.require(:admin_user).permit(
      :username,
      :first_name,
      :last_name,
      :password)
  end
end
