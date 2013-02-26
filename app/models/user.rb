class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  before_save :setup_role

  has_and_belongs_to_many :roles
  has_many :projects
  has_many :bids
  has_many :skills
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #has_attached_file :photo, :default_url => "/images/missing_:style.png", :styles => { :small => "50x50", :medium => "100x100" }
  has_attached_file :photo, 
    :default_url => "/images/missing_:style.png",
    :storage => :dropbox,
    :dropbox_credentials => "#{::Rails.root}/config/dropbox.yml",
    :styles => { :small => "50x50", :medium => "100x100" },
    :dropbox_options => {:path => proc { |style| "#{style}/#{id}_#{photo.original_filename}" }}

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :role_ids, :roles, :photo, :about_me

  self.per_page = 10

  def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
  end

  # Default role is "Registered"
  def setup_role 
    if self.role_ids.empty?     
      self.role_ids = [2] 
    end
  end

  def contactName
    return self.username.blank? ? self.email : self.username
  end

end
