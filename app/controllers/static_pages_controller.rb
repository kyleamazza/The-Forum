class StaticPagesController < ApplicationController
	layout "application", only: [:home]

	def index
		if session[:user]
			redirect_to controller: 'static_pages', action: 'home'
		end
	end

	def home
	end

	def clear
		if session[:user]
			session[:user] = nil
		end
		redirect_to controller: 'static_pages', action: 'index'
	end

end
