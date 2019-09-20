class UsersController < ApplicationController
  
  before_action :set_current_user
  before_action :user_signed_in?, only: [:create, :edit, :new]


  def index
  	@all_users = User.all
  end
  
  def new
    @user = User.new
  end 	

  def create
    User.create(user_params)
    redirect_to action: 'index'
  end	

  def show
   user_id=params[:id]
   @user = User.find(user_id)

  end
   	
  def edit
    @user = User.find(params[:id])

  end 	

  def update
    @user = User.find(params[:id])
    
    @user.update(user_params)
    redirect_to action: 'index'

  end	

  def delete
   @user = User.find(params[:id])
   @user.delete 
   
   redirect_to action: 'index'
  end	
   
  def sign_in

  end
  
  def create_session
    user=User.find_by(email: params[:email],password: params[:password])
     
    if (user.nil?)
       redirect_to action: "sign_in"
     else
      session[:user_id] = user.id

      redirect_to "/users/#{user.id}" 
     end  
  end	
     
  def sign_out
    if @current_user
      session.delete(:user_id)
      redirect_to action: "index"
    end
  end


  private

  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  def user_signed_in?
    if @current_user.blank?
      redirect_to action: "sign_in"
    end

  end

  def user_params
    params.require(:user).permit(:name, :age, :email, :password)
  end



end
