class UsersController < ApplicationController
include ActiveMerchant::Billing  
  before_filter :authenticate_user!, :except => [:show, :index]

  def show
    @user = User.find_by_user_name(params[:id])
    @title = @user.name
  end

  def new
    @title = "Sign up"
  end

 
def create    #This is the method where the HTML form is created and is posted to paypal  
end    

def notify    #The method is called when we get a response from paypal after the payment is done 
	p request.inspect   ipn 
end   

def ipn    #This is the method that takes care of checking the request object sending the request object again to paypal to check whether the request is confirmed or genuine, then it logs the corresponding message to a file. 

 notify = Paypal::Notification.new(request.raw_post)      
 	if notify.acknowledge         
		begin           
			my_file = File.new("filename.txt","w")           
			if notify.complete?               
				my_file.write "Transaction complete.. add your business logic here"               
				p "Transaction complete.. add your business logic here"           
			else              
				my_file.write "Transaction not complete, ERROR"              
				p "Transaction not complete, ERROR"           
			end          
			
			rescue => e           
			my_file.write "Amit we have a bug"           
			p "Amit we have a bug"         
			ensure           
			my_file.write "Make sure we logged everything we must"           
			p "Make sure we logged everything we must"         
		end         
		my_file.close       
	else         
		my_file.write "Another reason to be suspicious"         
		p "Another reason to be suspicious"     
	end      
	
	render :nothing => true   
	
	end 
end  

