class PostCommentsController < ApplicationController

	def create
		book = Book.find(params[:book_id])
		comment = book.post_comments.new(post_comment_params)
		comment.user_id = current_user.id
		comment.save
		redirect_to request.referer
	end

	def destroy
		PostComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
		redirect_to request.referer
	end

	def post_comment_params
		params.require(:post_comment).permit(:comment)
	end
	
end
