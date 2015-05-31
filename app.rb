require 'sinatra'
require 'sinatra/contrib/all'
require 'pg'
require 'pry-byebug'


get '/' do
  erb :index
end

get '/videos' do
  sql = "select * from videos"
  @videos = run_sql(sql)
    if request.xhr?
      json @videos.to_a
    else
      erb :index
    end
end


post '/videos' do
  title = params[:title]
  description = params[:description]
  url = params[:url]
  genre = params[:genre]
  sql = "insert into videos (title, description, url, genre) values ('#{title}', '#{description}', '#{url}', '#{genre}') returning *"
  @title = run_sql(sql).first
  @description = run_sql(sql)
  @url = run_sql(sql)
  @genre = run_sql(sql)
  if request.xhr?
    json @title
  else
    redirect_to '/videos'
  end
end



private

def run_sql(sql)
  connect = PG.connect(dbname: 'memetube_ajax', host: 'localhost')
  begin
    result = connect.exec(sql)
  ensure
    connect.close
  end
  result
end