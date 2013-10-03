require_relative '../../db/config'

class Student < ActiveRecord::Base
  has_many :classes
  has_many :teachers, :through => :classes

  validates :email, :uniqueness => true
  validates :email, :format => { :with => /.+@{1}.+\.+.{2}/, :message => "not correct email format"}
  validates :age, :numericality => { :greater_than_or_equal_to => 5 }
  validate :check_phone_number

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def age
    Time.now.year - self.birthday.year
    # ((Date.today - Date.parse(self.birthday))/365).to_i
  end

  def check_phone_number
    if phone.gsub(/[^\d]/,'').length < 10
      errors.add(:phone, "Invalid phone number")
    end
  end

  def self.distribute
    self.all.each do |student|
      student.teacher_id = rand(1..9)
      student.save
    end
  end

end

# def self.find_out
#   p self.all.each do |x|
#     p x
#   end
# end

# Experimenting w/ function to validate phone num
# str = "407-774-9393"
# arr = str.scan(/\d+/).to_a 
# sum = arr.reduce(:+) 
# p sum.length
# is_valid if sum.length >= 10

# Student.distribute

# t = Student.new
# p t.methods.sort
