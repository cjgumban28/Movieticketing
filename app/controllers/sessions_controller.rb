class SessionsController < ApplicationController
  def new
  end

  def create

    entered_email = params[:session][:email].downcase
    
    # checking whether the email is nil or not
    if entered_email != ""
      customer = Customer.find_by(email: params[:session][:email].downcase)

      # if customer is present in the database
      if customer 
        # checking whether the details of customer entered are authentic or not
        if customer && customer.authenticate(params[:session][:password])
          sign_in customer
          flash[:success] = "Welcome, you are signed in ..."
          redirect_to screens_index_path

        # else
        #   flash[:error] = "Password does not match"
        #   redirect_to sessions_new_path
        end

      else
        flash[:error]='Email does not exist'
        redirect_to sessions_new_path
      end

    else
      flash[:error]='Fields can not be blank'
      redirect_to sessions_new_path
    end
  end

  def destroy
    sign_out if signed_in?
    redirect_to root_path
    flash[:info] = "Signed Out !"
  end

end

# ----------------------------------------------------------------

# -----------------------------------------------------------------
        # @customers =Customer.all
        # entered_email = params[:session][:email].downcase    
        #elsif customer == nil
        #flash[:error]="Email field can't be blank"
        #redirect_to sessions_new_path    

        # elsif !customer.present?  
        #   flash[:error]='Email does not exist.'
        #redirect_to sessions_new_path   

# -----------------------------------------------------------------

# ------------------------ previous work --------------------------


  #   user = User.find_by(email: params[:session][:email])
  #   # user.present?
  #   if user && user.authenticate(params[:session][:password])
  #     # session[:user_id] = user.id
  #     sign_in user
  #     redirect_to screens_index_path
  
  #   else
  #     # flash[:danger]='Invalid credentials'
  #     render 'new'
  #   end
  # end




  # def current_user
  #   @current_user = @current_user || User.find_by(id: session[:user_id])
  # end

  # def signed_in?
  #   !current_user.nil?
  # end


  # def sign_in(user)
  #   session[:user_id] = user.id
  # end
# ---------------------------------------------------------------