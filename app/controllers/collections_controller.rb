class CollectionsController < ApplicationController
	before_action :signed_in_user, only: [:create, :destroy]
	# before_action :load_collection_user, except: [:add_video]
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
		@collection = Collection.find(params[:id])
	end

	def update
		@collection = Collection.find(params[:id])
		if @collection.update_attributes(collection_params)
			redirect_to collection_path(@collection)
		else
			render :edit
		end

	end


	def destroy

	end

	def add_video
		@video = Video.find(params[:video_id])
		@collection = Collection.find(params[:collection][:id])

		@collection.videos << @video

		redirect_to collection_path(@collection)
	end


	private

		def get_videos
			@collection = Collection.find(params[:id])
			@collections_videos = @collection.videos
		end

		# def load_collection_user
		# 	@user = User.find(params[:user_id])
		# end

		def collection_params
			params.require(:collection).permit(:title, :user_id, :description, :image)
		end

		def correct_user
			@collection = current_user.collections.find_by(id: params[:id])
			redirect_to root_url if @collection.nil?
		end

end

