class ApplicationController < Sinatra::Base

	configure do
		set :public_folder, 'public'
		set :views, 'app/views'
	end

	get "/articles/new" do
		erb :new
	end
	
	post "/articles" do
		@article = Article.create(params)
		
		redirect "/articles/#{@article.id}"
	end
	
	get "/articles" do
		@articles = Article.all
		
		erb :index
	end
	
	get "/articles/:id" do
		@article = Article.all.find(params[:id])
		
		erb :show
	end
	
	get "/articles/:id/edit" do
		@article = Article.all.find(params[:id])
		
		erb :edit
	end
	
	patch "/articles/:id" do
		@article = Article.all.find(params[:id])
		@article.update(title: params[:title], content: params[:content])
		
		redirect "/articles/#{@article.id}"
	end
	
	delete "/articles/:id" do
		@article = Article.all.find(params[:id])
		@article.delete
		
		redirect "/articles"
	end
	
end