
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    
  end
  get '/articles' do
    @articles = Article.all
    erb :index
  end
  get '/articles/new' do
    erb :'/articles/new'
  end
  get '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    erb :'articles/show'
  end
  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{Article.last.id}"
  end
  get '/articles/:id/edit' do
    @article = Article.find_by_id(params[:id])
    erb :'/articles/edit'
  end
  patch '/articles/:id' do
    @article = Article.find_by_id(params[:id])
    @article.title = params[:title]
    @article.content = params[:content]
    @article.save
    erb :'articles/show'  
  end
  delete '/articles/:id/delete' do 
    @article = Article.find_by_id(params[:id]) 
    @article.delete 
    erb :deleted
  end
end
