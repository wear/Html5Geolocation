class Category < ActiveRecord::Base
  validates_presence_of :name
  validates_presence_of :filter
  validates_presence_of :city
end
