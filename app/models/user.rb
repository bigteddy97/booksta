class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :about
  
  has_many :books
  has_many :chapters
  
  include Gravtastic
  gravtastic
  
  def to_s
    username
  end
  
  def to_param
    "#{id}-#{username.downcase}".gsub(/[^a-zA-Z0-9]+/, '-').gsub(/-{2,}/, '-').gsub(/^-|-$/, '')
  end
end
