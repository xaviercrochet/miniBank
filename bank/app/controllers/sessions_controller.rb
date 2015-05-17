class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(name: params[:session][:name])
		if(user && user.authenticate(params[:session][:password]))
			log_in user
  		redirect_to home_path #to change
  	else
  		flash.now[:error] = 'Invalid credentials'
  		render 'new'
  	end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end
