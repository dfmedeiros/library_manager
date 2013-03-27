class Employee < ActiveRecord::Base
  devise :database_authenticatable, :rememberable, :validatable

  attr_accessible :full_name, :registration, :email, :password, :password_confirmation, :remember_me

  has_many :loans 
end
