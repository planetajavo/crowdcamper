class SitesController < ApplicationController
	def home
		render 'home', layout: false
	end
	def contact
		render 'contact', layout: false
	end
end
