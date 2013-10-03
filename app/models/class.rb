require_relative '../../db/config'

class Class < ActiveRecord::Base
  has_many :students

end
