class CollectionsController < ApplicationController 
	before_action :signed_in_user, only: [:create, :destroy, :new]
	before_action :correct_user, only: :destroy

	def new
		@collection = Collection.new
	end

	def index
	end

	end 

	def index
		@collections = Collection.all 
	end 


	def create
		@collection = current_user.collections.build(collection_params)
		if @collection.save
			flash[:success] = "Collection created!"
			redirect_to collections_url
		else
			render 'static_pages/home'
		end
	end

	def show
		@collection = Collection.find(params[:id])
		if current_user
			@video = @collection.videos.build
		end
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
			@collection = current_user.collections.find_by(id: params[:id])
			redirect_to root_url if @collection.nil?
		end


end
