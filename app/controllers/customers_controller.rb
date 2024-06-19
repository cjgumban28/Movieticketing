class CustomersController < ApplicationController
  def index
    # ----------------------------------------------------------------
    # ------- used when we have to get all users of that movie--------
    # binding.pry
    # if params[:movie_id].present?
    #   @customers = Customer.where(movie_id:params[:movie_id])
    # else
    #   @customers =Customer.all
    # end
    # ----------------------------------------------------------------
  end

  def show
    # @customer =Customer.find(params[:id])
  end

  def new
    @customer = Customer.new
  end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      sign_in @customer
      flash[:success] = "Welcome, you have successfully created your account !"
      redirect_to screens_index_path
    else
      render 'new', status: :unprocessable_entity
    end
  end

  def edit
    @customer = Customer.find(params[:customer_id])
    @movie = Movie.find(params[:movie_id])
    @theatre = Theatre.find(params[:theatre_id])

  end

  def update
    @customer = Customer.find(params[:customer_id])
    if @customer.update(book_ticket)
      redirect_to sessions_index_path
    end
  end


    # ----------------------------------------------------

    # @movie = Movie.find_by(id: params[:movie_id])
    
    # @customer = @movie.customers.build(customer_params)
    # @customer.save
    # redirect_to users_path
    # render plain: "Ticket Booked"

    #  ---------------------------------------------------



  private

  #-------- to book the ticket --------

    def book_ticket
      params.permit(:theatre_id,:movie_id)
    end

  # ------- to create a new customer/sign_up --------

    def customer_params
      params.require(:customer).permit(:email, :password, :password_confirmation)
    end
end
