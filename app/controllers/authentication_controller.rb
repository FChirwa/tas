class AuthenticationController < ApplicationController
	require 'will_paginate'
	def initialize
		@current_page = []
		@item = []
	  @item << "That was beyond repair no hope was available by the owner"
		@item << "Wow, after a nice work by our personel that is how it looks now"

		@item_1 = []
	  @item_1 << "Un-alighned tyres may cause you alot of accidents and harm"
		@item_1 << "Drive safely, enjoy your seat, do not tussle with your steering.... Mbasibale have taken care of it all"

		@item_2 = []
	  @item_2 << "Blackouts cause colusions which cause unlimited and fatal effects"
		@item_2 << "Let others know your existence on the road, we fix the wires for you"

		@item_3 = []
	  @item_3 << "That was beyond repair no hope was available by the owner"
		@item_3 << "Wow, after a nice work by our personel that is how it looks now"
	end
  def index
		
  end
	def contact

	end
	def blog
		@page = []
		@message = []
		if ! params[:id].nil?
					Customer.find_by_sql("select message, title, c.created_at, c.customer_id from customer_messages c
																		inner join titles t on t.customer_message_id = c.id
																		inner join customers cs on cs.id = c.customer_id
																		where c.customer_id = '#{params[:id]}'
																		and c.message_id = 2 order by c.created_at desc limit 10").each do |customer|
																			next if customer.title.nil?
																			@page << customer
																	end
				Customer.find_by_sql("select message, title, c.created_at, c.customer_id from customer_messages c
																		inner join titles t on t.customer_message_id = c.id
																		inner join customers cs on cs.id = c.customer_id
																		where c.customer_id = #{params[:id]}
																		and c.message_id = 1
																		order by c.created_at desc limit 1").each do |customer|
																			next if customer.title.nil?
																			@message << customer
																	end
					params[:id] = nil;
					#raise params[:id].to_yaml
		else
		Customer.find_by_sql("select message, title, c.created_at, c.customer_id from customer_messages c
																		inner join titles t on t.customer_message_id = c.id
																		inner join customers cs on cs.id = c.customer_id
																		where cs.id >= 1
																		and c.customer_id >= 1
																		and t.customer_message_id >= 1
																		order by c.created_at desc limit 10").each do |customer|
																			next if customer.title.nil?
																			@page << customer
																	end
				@message = nil
		end
		
	end
	def gallery

	end
	def about

	end


	def add_blog
		cp = MessageType.find_by_description("customer message").id
		cust = Customer.new
		cust.first_name = params["name"].split(" ").first
		cust.last_name = params["name"].split(" ").last
		cust.save
		mess = CustomerMessage.new
		mess.message_id = cp
		mess.customer_id = cust.id
		mess.message = params["message"]
		mess.save
		title = Title.new
		title.customer_message_id = mess.id
		title.title = params["title"]
		title.save
		redirect_to "authentication/blog" and return
		
	end
end
