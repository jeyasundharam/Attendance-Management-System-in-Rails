class StudentsiteController < ApplicationController
  def showinformations
    @student=Student.find(params[:id])
  end
  def showtimetable
  end
  def showdayorder
  
  end
  def showreasons
  
  end
  def showattendance
      @student=Student.find(params[:id])
  end
end
