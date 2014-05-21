class CohortsController < ApplicationController

  # GET /cohorts
  def index
    @cohorts = Cohort.all
  end

  # GET /cohorts/new
  def new
    @cohort = Cohort.new
    # @classrooms = Classroom.where("location_id = ?", ch.course.location_id)
    @classrooms = Classroom.all
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
    @cohort = Cohort.includes(:students).find(params[:id])
  end

  # GET /cohorts/1/edit
  def edit
    @cohort = Cohort.find(params[:id])
  end

  # PUT /cohorts/1
  def update
    @cohort = Cohort.find(params[:id])
    @cohort.enroll_users(params[:users])
    @cohort.assign_instructors(params[:users])
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

#----OTHER-THAN-CRUD-----------  

  # GET /cohorts/1/enroll
  def enroll
    @cohort = Cohort.find(params[:id])
    @users = User.who_can_enroll @cohort
    render "enroll"
  end

  # GET /cohorts/1/assign_teachers
  def assign_teachers
    @cohort = Cohort.find(params[:id])
    @users = User.who_is_instructor @cohort
    render "assign_teachers"
  end

end