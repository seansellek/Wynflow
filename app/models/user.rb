class User < ActiveRecord::Base
  require 'digest/md5'
  has_secure_password
  has_many :projects
  has_many :upvotes

  def get_email_hash
    email = self.email
    email.strip!
    Digest::MD5.hexdigest(email)
  end
end
