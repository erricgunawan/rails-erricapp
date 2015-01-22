class JournalsController < ApplicationController
	before_action :logged_in_user
	def create
		# render json: params and return
		@journal = current_user.journals.
			# build(params[:journal])
			build(journal_params)

		if @journal.save
			# redirect_to root_path, notice: 'Journal created!'
			render partial: 'journal'

			# respond_to do |format|
			# 	format.js
			# 	format.json { render json: @journal }
			# 	format.xml { render xml: @journal }
			# end
		else
			# render 'static_pages/home', alert: 'Something wrong'
			redirect_to root_url, alert: 'Something wrong'
		end
	end

	private

	def journal_params
		params.require(:journal).permit(:title, :content)
	end

end
