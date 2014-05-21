class CohortsController < ApplicationController

  # GET /cohorts
  def index
    @cohorts = Cohort.all
  end

  # GET /cohorts/new
  def new
    @cohort = Cohort.new
  end

  # POST /cohorts
  def create
    @cohort = Cohort.new(params[:cohort])
    if @cohort.save
      redirect_to @cohort, notice: 'Course was successfully created.'
    else
      render action: "new"
    end
  end

  # GET /cohorts/1
  def show
    @cohort = Cohort.find(params[:id])
    # role = @user.role || "default"
    # render "#{role}_show"
    
    # render "courses/index"
  end

  # GET /cohorts/1/edit
  def edit
    @cohort = Cohort.find(params[:id])
  end

  # PUT /cohorts/1
  def update
    @cohort = Cohort.find(params[:id])
    if @cohort.update_attributes(params[:cohort])
      redirect_to @cohort, notice: 'Course was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /cohorts/1
  def destroy
    @cohort = Cohort.find(params[:id])
    @cohort.destroy
    redirect_to(cohorts_path)
  end

end