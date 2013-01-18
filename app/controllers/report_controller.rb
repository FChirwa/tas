class ReportController < ApplicationController
	def initialize(start_date, end_date)
		@start_date = start_date
		@end_date = end_date
	end
	def index
		render :layout => "report"
	end
end
