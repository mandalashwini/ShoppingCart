class StudentController < ApplicationController
  def index
  end
 
 
  def show
    
    create
    puts @student
  end


  def create
    puts "hello"
    #render plain:params.inspect
    @student=Student.new(firstname:params[:firstname],lastname:params[:lastname],emailid:params[:emailid],mobilenumber:params[:mobilenumber],date_of_birth:params[:date_of_birth],gender:params[:gender],password:params[:password],confirm_password:params[:confirm_password])
    if @student.save
        puts "success"
        
        
    else
      puts "fail"
     request.referer
    end
   
  end
  
  
end

