class ApplicationController < ActionController::Base
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	def do_login(user)
		session[:user_id] = user.id unless session[:user_id]
	end

	# def current_user
	# 	@current_user = User.find_by(id: session[:user_id])
	# end

	def logged_in_user
		redirect_to login_url, 
			alert: 'Please login dulu bro' unless session[:user_id]
	end

	def correct_user
		# byebug
		redirect_to root_url,
			# alert: 'Gak boleh ke sini ya bro' unless params[:id] == session[:user_id]
			alert: 'Gak boleh ke sini ya bro' unless params[:id].to_i == session[:user_id]
	end

end
