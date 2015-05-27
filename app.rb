require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry-byebug'


get '/' do
  redirect to ('/videos')
end

get '/videos' do
  sql = 'selet * from videos'
  @videos = run_sql(sql)
  erb :index
end

get '/videos/new' do
  erb :new
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