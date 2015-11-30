class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	devise	:database_authenticatable, :registerable,
        	:recoverable, :rememberable, :trackable, :validatable

	has_many :projects, dependent: :destroy


    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 8 }, unless: "password.nil?"
    validates :password, presence: true, if: "id.nil?"



end
