class ArticlesController < ApplicationController
	
	http_basic_authenticate_with name: "mky", password: "admin", except: [:index, :show]
	
	before_action :find_article, only:[:show,:edit,:update,:destroy]

	def create
  	@article = Article.new(article_params)

	  	if @article.save
	 		redirect_to @article
		else
			render 'new'
		end
	end

	def new
		@article = Article.new
	end


	def index
		@articles =Article.includes(:comments).all
		@comments =Comment.all

		if params[:q].present?
			@articles=@articles.where(title: params[:q])
		end
	end
	
	def update

		if @article.update(article_params)
			redirect_to @article
		 else
		    render 'edit'
		end
	end	

	def show
	end

	def edit
	end
	
	def destroy
		@article.destroy
		redirect_to articles_path
	end

	private

 		def article_params
 	   		params.require(:article).permit(:title, :text)
	 	end	

	 	def find_article
			@article =Article.find(params[:id])
	 	end

end
