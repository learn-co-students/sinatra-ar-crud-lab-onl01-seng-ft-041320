
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  #index
  get '/articles' do
    @articles = Article.all
    erb :index
  end

  #new
  get '/articles/new' do
    erb :new
  end

  #show
  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    erb :show
  end

  #create
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    # @article.title = params[:title]
    # @article.content = params[:content]
    redirect to "/articles/#{@article.id}"
  end

  #edit
  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  #update
  patch '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.update(title: params[:title], content: params[:content])
    redirect to "/articles/#{@article.id}"
  end

  #destroy
  delete '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.destroy
    redirect to "/articles"
  end

end
