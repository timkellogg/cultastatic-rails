class User < ActiveRecord::Base
  has_many :reviews
  belongs_to :user

  validates :username, presence: true,
                       uniqueness: true,
                       length: { maximum: 20 }
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
