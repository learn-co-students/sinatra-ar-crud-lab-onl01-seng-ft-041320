
require_relative '../../config/environment'

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


end
