module SessionsHelper
	def hello_world
		"hello erric"
	end

	def current_user
		# @current_user = @current_user || User.find_by(id: session[:user_id])
		@current_user ||= User.find_by(id: session[:user_id])
	end

end
