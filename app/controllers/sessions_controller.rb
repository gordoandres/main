class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by(email: params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			ingreso user
			redirect_back_or user
		else
			flash.now[:error] = 'Combinacion email/password invalida'
			render 'new'
		end
	end

	def destroy
		salir
		redirect_to root_url
	end
end