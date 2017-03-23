require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true
  property :password_digest, Text, required: true

  def password=(password)
    self.password_digest = BCrypt::Password.create(password) unless password.empty?
  end

  def self.authenticate(email, password)
    user = User.first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def self.create_user(params)
    User.create(email: params[:email], password: params[:password]) unless User.first(email: params[:email])
  end

end
