class StudentsController < ApplicationController
 def index
 @students = Student.all
  respond_to do |format|
    format.html
    format.csv { send_data @students.to_csv }
    format.xls # { send_data @products.to_csv(col_sep: "\t") }
  end
 end
  def insert
    @student=Student.new
  end

  def edit
   @student = Student.find(params[:id])
  end

  def delete
  
  end
  def update
    @student = Student.find(params[:id])
    if @student.update(student_params)	
      flash[:notice]="Your Article updated"
	    render 'edit'
    else
      flash[:notice]="Your Article Not updated"
      render 'edit'
    end
  end
  def destroy
   @student = Student.find(params[:id])
    if @student.destroy
	 flash[:notice]="Student deleted"
	else
	 flash[:notice]="Student not deleted"
    end
    render:insert
  end
  def show
    @studentclass=Student.select(:studentclass).distinct  
    @department=Student.select(:department).distinct  
    if params[:studentclass]
      @students=Student.where(:studentclass => params[:studentclass])   
    else
      @students=Student.all
    end
  end
  
  def create
  	@student = Student.new(student_params)
	if @student.save
	   flash[:notice]="Student Added Successfully"
 	   redirect_to students_insert_url
 	else
 	   flash[:notice]="Student Not Added "
           render "insert" 
  	end
  end
  
  def checkgmail
  	if Student.where('gmail = ?', params[:gmail]).count == 0
 	  	print "Valid Gmail"
  	else
 		  print "Gmail Not Valid"
  	end
  end
  def filterstudents
  
  end

  def updateattendance 
	  @students=Student.all
  end
  def putattendance
  @absentees=params[:attendance][:absentees]
  render "delete"
  end
  private
  def student_params
	  params.require(:student).permit(:rno,:studentname,:avatar,:gender,:studentclass,:department,:mobileno,:gmail,:dob)
  end
  def attendence_params
  	params.require(:attendance).permit(absentees: [])
  end
end
