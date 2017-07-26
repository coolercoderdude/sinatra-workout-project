require './lib/slug_module.rb'

class User < ActiveRecord::Base
  has_many :user_workouts
  has_many :workouts, through: :user_workouts
  has_many :user_exercises
  has_many :exercises, through: :user_exercises

  has_secure_password
  validates_presence_of :username, :email, :password

  extend SlugHelper

  def slug
    username.downcase.gsub(" ", "-")
  end

end
