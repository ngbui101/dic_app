class ApplicationController < ActionController::Base
	def log_out
  	session.delete :user_id
	end
end
