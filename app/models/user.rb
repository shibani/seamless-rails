class User < ActiveRecord::Base

  acts_as_token_authenticatable
  after_create :save_hashed_id 
  #field :authentication_token

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  before_save :ensure_authentication_token

  has_one :user_info, dependent: :destroy

  has_many :addresses

  after_create :save_hashed_id 

  def save_hashed_id
    hashids = Hashids.new("t22t3!orn", 8)
    hash = hashids.encode(self.id)
    self.hash_id = hash
    self.save
  end

  def ensure_authentication_token
    if authentication_token.blank?
      self.authentication_token = generate_authentication_token
    end
  end

  def as_json(options={})
    {
      id: self.id,
      email: self.email
    }
  end

  private
  
  def generate_authentication_token
    loop do
      token = Devise.friendly_token
      break token unless User.where(authentication_token: token).first
    end
  end
end
