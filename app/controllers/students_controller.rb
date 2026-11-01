class StudentsController < ApplicationController

  # Display all students
  def index
    @students = Student.all
  end

  # Show form to create a new student
  def new
    @student = Student.new
  end

  # Save new student
  def create
    @student = Student.new(student_params)

    if @student.save
      redirect_to students_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Display one student
  def show
    @student = Student.find(params[:id])
  end

  # Show edit form
  def edit
    @student = Student.find(params[:id])
  end

  # Update student
  def update
    @student = Student.find(params[:id])

    if @student.update(student_params)
      redirect_to students_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # Delete student
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    redirect_to students_path
  end


  private

  # Allow only these fields
  def student_params
    params.require(:student).permit(
      :name,
      :email,
      :department,
      :marks
    )
  end
end