
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    erb :index
  end

  get '/articles' do
    #binding.pry
    @articles = Article.all
    erb :index
  end

  post '/articles' do
    @article = Article.create(params)
    new_url = '/articles/' + @article.id.to_s
    redirect new_url
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    #binding.pry
    erb :show
  end

  patch '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    @article.title   = params[:title]
    @article.content = params[:content]
    @article.save
    erb :show
  end

  get '/articles/:id/edit' do
    @article = Article.find_by(id: params[:id])
    erb :edit
  end

  delete '/articles/:id' do
    Article.destroy(params[:id])
    redirect '/articles'
  end
end
