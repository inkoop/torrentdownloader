require 'rubygems'
require 'bundler'
require 'sidekiq/api'
require_relative "./worker.rb"

Bundler.require(:default, :development)

set :bind, '0.0.0.0'
set :port, '80'

get '/', provides: 'html' do
  @processes = Sidekiq::ProcessSet.new 
  haml :index
end

post '/torrents' do
  torrent_url = params[:torrent]
  Worker.perform_async torrent_url
  redirect to('/')
end

