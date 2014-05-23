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
    authorize! :create, Cohort
  end

  # POST /cohorts
  def create

    @cohort = Cohort.new(params[:cohort])
    @classrooms = Classroom.all
    authorize! :create, Cohort
    # @classroom = Classroom.find(params[:classroom_id])
    if Booking.is_classroom_available?(params[:classroom_id], @cohort.start_date, @cohort.end_date)
      unless @cohort.save
        render action: "new" and return
        
      end
    else
      flash.now[:alert] = 'This room is occupied during the specified time.' 
      render action: "new" and return   
    end
    @booking = Booking.new({
      cohort_id: (@cohort.id),
      classroom_id: params[:classroom_id],
      start_date: @cohort.start_date,
      end_date: @cohort.end_date
    })
    if @booking.save
        redirect_to @cohort, notice: 'Cohort was successfully created.'
    else
        @cohort.destroy
        render action: "new", alert: 'I could not create a new booking entry, please contact the system administrator.'
    end
  end

  # GET /cohorts/1
  def show
    @cohort = Cohort.includes(:students).find(params[:id])
    authorize! :edit, Cohort
  end

  # GET /cohorts/1/edit
  def edit
    @cohort = Cohort.find(params[:id])
    @classrooms = Classroom.all
    authorize! :edit, Cohort
  end

  # PUT /cohorts/1
  def update
    @cohort = Cohort.find(params[:id])
    @classrooms = Classroom.all
    authorize! :update, Cohort
    if params[:user_type] == "students"
      @cohort.enroll_users(params[:users])
    elsif params[:user_type] == "instructors"
      @cohort.assign_instructors(params[:users])
    elsif params[:enrollments_users].present?
      @cohort.update_enrollments params[:enrollments_users]
    end
    @cohort.save
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
    authorize! :manage, Cohort
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


  def remove_enrollment
    cohort = Cohort.find params[:id]
    enrollment = cohort.enrollments.where(student_id: params[:student_id]).first
    enrollment.delete
    flash[:notice] = "The student has been successfully removed from the cohort #{cohort.name}"
    redirect_to cohort_path(cohort)
  end
end