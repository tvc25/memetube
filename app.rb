require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry-byebug'


get '/' do
  redirect to ('/videos')
end

get '/videos' do
  sql = 'select * from videos'
  @videos = run_sql(sql)
  erb :index
end

get '/videos/new' do
  erb :new
end

post '/videos' do
  sql = "INSERT INTO videos (title, description, url, genre) VALUES ('#{params[:title]}', '#{params[:description]}', '#{params[:url]}', '#{params[:genre]}')"
  run_sql(sql)
  redirect to('/videos')
end





def run_sql(sql)
  conn = PG.connect(dbname: 'memetube', host: 'localhost')
  begin
    result = conn.exec(sql)
  ensure
    conn.close
  end
  result
end