require_relative '../../db/config'
require 'faker'

class Teacher < ActiveRecord::Base
  has_many :students

  validates :email, :uniqueness => true
  validates :email, :format => { :with => /.+@{1}.+\.+.{2}/, :message => "Invalid email format"}

  def name
    "#{self.first_name} #{self.last_name}"
  end

end
