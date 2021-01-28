
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
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.new(title: params[:title], content: params[:content])
    erb :show
  end

  get '/articles/:id' do
    @article = Article.find_by(:id)
    erb :show
  end

  get '/articles/:id/edit' do
    erb :edit
  end

  patch '/articles/:id' do
    @article.title = params[:title]
    @article.content = parms[:content]
    erb :show
  end

  delete '/articles/:id' do
    article = Article.find_by(:id)
    article.delete
  end
end
