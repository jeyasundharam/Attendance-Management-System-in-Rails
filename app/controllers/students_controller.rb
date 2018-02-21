class StudentsController < ApplicationController
  def insert
  end

  def edit
  end

  def delete
  end

  def show
      @students=Student.all
  end
  
  def create
  	@student = Student.new(student_params)
	if @student.save
	   flash[:notice]="Student Added Successfully"
 	else
 	   flash[:notice]="Student Added " 
  	end
        render:insert
  end
 
  private
  def student_params
	  params.require(:student).permit(:rno,:studentname,:gender,:studentclass,:department,:mobileno,:gmail,:dob)
  end
  def updateattendance
  end
end
