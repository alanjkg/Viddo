class CollectionsController < ApplicationController 
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy

	def new
	end 

	def index
	end 

	def create 
		@collection = current_user.collections.build(collection_params)
		if @collection.save
			flash[:success] = "Collection created!"
			redirect_to root_url
		else
			render 'static_pages/home'
		end 
	end 

	def show
	end 

	def edit
		
	end 

	def update

	end 

	def destroy

	end 


	private 

		def collection_params
			params.require(:collection).permit(:title, :user_id)
		end 

		def correct_user
			@collection = current_user.collections.find_by(id: perams[:id])
			redirect_to root_url if @list.nil?
		end 


end 