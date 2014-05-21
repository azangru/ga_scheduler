class ClassroomsController < ApplicationController

  # GET /rooms
  def index
    @classrooms = Classroom.all
  end

  # GET /rooms/new
  def new
    @classroom = Classroom.new
  end

  # POST /rooms
  def create
    @classroom = Classroom.new(params[:classroom])
    if @classroom.save
      redirect_to @classroom, notice: 'Classroom was successfully created.'
    else
      render action: "new"
    end
  end

  # GET /rooms/1
  def show
    @classroom = Classroom.find(params[:id])
  end

  # GET /rooms/1/edit
  def edit
    @classroom = Classroom.find(params[:id])
  end

  # PUT /rooms/1
  def update
    @classroom = Classroom.find(params[:id])
    if @classroom.update_attributes(params[:classroom])
      redirect_to @classroom, notice: 'Classroom was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /rooms/1
  def destroy
    @classroom = Classroom.find(params[:id])
    @classroom.destroy
    redirect_to(classrooms_path)
  end

end