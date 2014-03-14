class CommentsController < ApplicationController
	before_action :correct_user, only: :destroy
	before_action :signed_in_user, only: :create
	before_action :load_video, :only => :create

	def new
		@comment = Comment.new
	end

	def create
		@comment = @video.comments.build(comments_params)
		@comment.user_id = current_user.id
		if @comment.save
			flash[:success] = "Thanks for the comment!"
			respond_to do |format|
				format.html { redirect_to video_path(@video) }
				format.json do
					render :json => @comment.to_json
				end
			end
		else
			render :new
		end
	end

	def index
		@comment = Comment.all
	end

	def show
		@video = Video.find(params[:video_id])
		@comment = Comment.find(params[:id])
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update_attributes(comment_params)
			redirect_to comment_path(@comment)
		else
			render :edit
		end
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
	end

	private

		def load_video
			@video = Video.find(params[:video_id])
		end

		def comments_params
			params.require(:comment).permit(:blog, :user_id, :video_id, :collection_id)
		end

		def correct_user
			@comment = current_user.comments.find_by(id: params[:id])
			redirect_to root_url if @comment.nil?
		end

end