require 'sinatra'
require 'data_mapper'
require_relative 'models/user'
require_relative 'models/post'

DataMapper::Logger.new($stdout, :debug)
DataMapper.setup(:default, ENV['DATABASE_URL'] || 'postgres://localhost/buckly')
DataMapper.finalize
DataMapper.auto_upgrade!

get '/' do
    user = User.first_or_create({:name => 'testbot'}, {:password => 'test'})
    
    Post.create(:message => "Just a test", :user => user)
    
    @posts = Post.all(:order => [:created_at.desc])
    
    erb :index
end
