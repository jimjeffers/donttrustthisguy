class Post < ActiveRecord::Base
  validates_uniqueness_of :title
  validates_presence_of :title
  validates_presence_of :content
  
  TYPES = ['idea','design','quote','essay']
end
