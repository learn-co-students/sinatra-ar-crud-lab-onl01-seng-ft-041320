require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

#Index
  get '/articles' do
    @articles = Article.all
    erb :index
    end

#New
  get '/articles/new' do
  erb :new
  end

#Create
  post '/articles' do
    article = Article.create(params[:article])
    redirect to "/articles/#{article.id}"
    end

#Edit
  get '/articles/:id/edit' do
    id = params[:id]
    @article = Article.find_by(id: id)
    erb :edit
  end

#Update
  patch '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    article.update = params[:article]
    redirect to "/articles/#{article.id}"
  end

#Show
    get '/articles/:id' do
      id = params[:id]
      @article = Article.find_by(id: id)
      erb :show
    end

end
