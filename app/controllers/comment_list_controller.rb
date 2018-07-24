class CommentListController < ApplicationController

	def index
		#@comments =Comment.limit(20).all.
		@comments =Comment.all
	end

end
