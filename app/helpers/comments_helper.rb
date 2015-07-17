module CommentsHelper
	def comment_params
	  params.require(:comment).permit(:author_name, :body, :tag_list)
	end
end
