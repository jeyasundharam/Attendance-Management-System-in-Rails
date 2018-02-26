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
    @student = Student.new
    @student.build_address
    @student.build_attendance
    #1.times { @student.addresses.build} it for has_many
  end

  def edit
   @student = Student.find(params[:id])
  end

  def delete
  
  end
  
  def update
    @student = Student.find(params[:id])
    if @student.update(update_params)
      flash[:notice]="Student Information updated"
	    render 'edit'
    else
      flash[:notice]="Student Information Not updated"
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
    redirect_to students_show_url
   end
  def show
    @studentclass=Student.select(:studentclass).distinct
    @department=Student.select(:department).distinct
   
  if params[:studentclass] || params[:department] || params[:rno] || params[:name]
    if (params[:studentclass]!='' && params[:department]!='' && params[:rno]!='' && params[:name]!='')
      @students=Student.where('studentname LIKE ?', "%#{params[:name]}%").where(
       "studentclass = '#{params[:studentclass]}' AND department ='#{params[:department]}' AND rno='#{params[:rno]}'")
    elsif (params[:studentclass]!='' && params[:department]!='' && params[:name]!='')
     @students=Student.where('studentname LIKE ?', "%#{params[:name]}%").where(
      "studentclass = '#{params[:studentclass]}' AND department ='#{params[:department]}'") 
    elsif (params[:studentclass]!='' && params[:department]!='' && params[:rno]!='')
      @students=Student.where("studentclass = '#{params[:studentclass]}' AND department ='#{params[:department]}' AND rno='#{params[:rno]}'")
    elsif (params[:studentclass]!='' && params[:rno]!='' && params[:name]!='')
        @students=Student.where('studentname LIKE ?', "%#{params[:name]}%").where(
         "studentclass = '#{params[:studentclass]}' AND rno='#{params[:rno]}'")
    elsif (params[:department]!='' && params[:rno]!='' && params[:name]!='')
      @students=Student.where('studentname LIKE ?', "%#{params[:name]}%").where(
       "department ='#{params[:department]}' AND rno='#{params[:rno]}'")
    elsif (params[:studentclass]!='' && params[:department]!='')
      @students=Student.where(
       "studentclass = '#{params[:studentclass]}' AND department ='#{params[:department]}'") 
    elsif (params[:studentclass]!='' && params[:name]!='')
        @students=Student.where('studentname LIKE ?', "%#{params[:name]}%").where(
         "studentclass = '#{params[:studentclass]}'") 
    elsif (params[:studentclass]!='' && params[:rno]!='')
          @students=Student.where(
           "studentclass = '#{params[:studentclass]}' AND rno='#{params[:rno]}'")
    elsif (params[:department]!='' && params[:name]!='')
            @students=Student.where('studentname LIKE ?', "%#{params[:name]}%").where(
             "department ='#{params[:department]}'") 
    elsif (params[:department]!='' && params[:rno]!='')
      @students=Student.where(
        "department ='#{params[:department]}' AND rno='#{params[:rno]}'")
     elsif (params[:rno]!='' && params[:name]!='')
             @students=Student.where('studentname LIKE ?', "%#{params[:name]}%").where(
                 "rno='#{params[:rno]}'")
    elsif (params[:studentclass]!='')
             @students=Student.where("studentclass = '#{params[:studentclass]}'")
    elsif (params[:name]!='')
              @students=Student.where('studentname LIKE ?', "%#{params[:name]}%")
    elsif (params[:department]!='')
      @students=Student.where("department ='#{params[:department]}'")
    elsif (params[:rno]!='')
      @students=Student.where("rno='#{params[:rno]}'")
    end
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
    @fn=params[:attendance][:fnabsentees]
    @an=params[:attendance][:anabsentees]
    @students=Student.all
    @students.each do |student|
      if @fn.include? student.rno
        student.attendance.increment!(:absent,0.5)
      else
        student.attendance.increment!(:present,0.5)
      end
      if @an.include? student.rno
        student.attendance.increment!(:absent,0.5)
      else
        student.attendance.increment!(:present,0.5)
      end
      student.attendance.increment!(:total)
    end
    render "delete"
  end
  private
  def student_params
    params.require(:student).permit(:rno,
                                    :studentname,
                                    :avatar,
                                    :gender,
                                    :studentclass,
                                    :department,
                                    :mobileno,
                                    :gmail,
                                    :dob,
                                    address_attributes: [:doorno,:street,:area,:city,:district,:state,:country,:pincode],
                                    attendance_attributes: [:present,:absent,:total]
                                    )
  end
  def update_params
    params.require(:student).permit(:rno,
                                    :studentname,
                                    :avatar,
                                    :gender,
                                    :studentclass,
                                    :department,
                                    :mobileno,
                                    :gmail,
                                    :dob,
                                    address_attributes: [:doorno,:street,:area,:city,:district,:state,:country,:pincode],
                                    )
  end
end
