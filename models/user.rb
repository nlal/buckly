require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt
  
  property :id,               Serial
  property :name,             String, :unique => true, :required => true
  property :password_hash,    BCryptHash, :required => true
  property :created_at,       DateTime
  
  has n, :posts
  
  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
  
end