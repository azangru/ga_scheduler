class UsersController < ApplicationController

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  def create
    @user = User.new(params[:user])
    if @user.save
      # if no session key for the form_Step, then create one 
      # session[:form_step] = 1
      # also save the user_id that has just been saved
      # session[:user_id_in_creation] = 12
      # render new 
      redirect_to @user, notice: 'User was successfully created.'
    else
      render action: "new"
    end
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
    # role = @user.role || "default"
    # render "#{role}_show"
    
    # render "courses/index"
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy
  end

end