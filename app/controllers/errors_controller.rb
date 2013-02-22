class ErrorsController < ApplicationController
	def not_found
		@not_found_path = params[:not_found]

		respond_to do |format|
			format.html { render :template => "errors/404", :status => 404 }
			format.all { render :nothing => true, status => 404 }
		end
	end

	def change_rejected
		respond_to do |format|
			format.html { render :template => "errors/422", :status => 422 }
			format.all { render :nothing => true, status => 422 }
		end
	end

	def internal_error
		respond_to do |format|
			format.html { render :template => "errors/500", :status => 500 }
			format.all { render :nothing => true, status => 500 }
		end
	end
end