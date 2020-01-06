class ApplicationController < ActionController::Base
	# Ignore CSRF :D
	protect_from_forgery with: :null_session

	def index
		render template: "index"
	end
end
