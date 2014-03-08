class CollectionsController < ApplicationController 
	before_action :signed_in_user, only: [:create, :destroy]
	before_action :correct_user, only: :destroy
	layout 'application', :except => [:index, :new, :create, :show]

	def new
		@collection = Collection.new
	end

	def index
		@collections = Collection.all
		@collections = Collection.search(params[:search])
	end 


	def create
		@collection = current_user.collections.build(collection_params)
		if @collection.save
			flash[:success] = "New Collection created!"
			redirect_to collections_url
		else
			render 'collections#index'
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
			params.require(:collection).permit(:title, :user_id, :description, :image)
		end

		def correct_user
			@collection = current_user.collections.find_by(id: params[:id])
			redirect_to root_url if @collection.nil?
		end

end

