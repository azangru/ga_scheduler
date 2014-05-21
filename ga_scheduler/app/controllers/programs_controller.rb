class ProgramsController < ApplicationController

  # GET /programs
  def index
    @programs = Program.includes(:courses, :cohorts).all # .includes - to get all info in one query
  end

  # GET /programs/new
  def new
    @program = Program.new
  end

  # POST /programs
  def create
    @program = Program.new(params[:program])
    if @program.save
      redirect_to @program, notice: 'Program was successfully created.'
    else
      render action: "new"
    end
  end

  # GET /programs/1
  def show
    @program = Program.includes(:courses, :cohorts).find(params[:id])
    # role = @user.role || "default"
    # render "#{role}_show"
    
    # render "courses/index"
  end

  # GET /programs/1/edit
  def edit
    @program = Program.find(params[:id])
  end

  # PUT /programs/1
  def update
    @program = Program.find(params[:id])
    if @program.update_attributes(params[:program])
      redirect_to @program, notice: 'Program was successfully updated.'
    else
      render action: "edit"
    end
  end

  # DELETE /programs/1
  def destroy
    @program = Program.find(params[:id])
    @program.destroy
    redirect_to(programs_path)
  end

end