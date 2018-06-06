class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :orders,dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  before_save :set_default_role
  validates :firstname, :lastname,presence: true, format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }
  validates :mobile_number, presence: true, format: { with: /\A[0-9]{10}+\Z/, message: "only allows numbers " }
  
  protected
  def set_default_role
    if self.role.nil?
      self.role = "user"
    end
  end
end
