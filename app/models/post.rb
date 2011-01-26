# class Post < ActiveRecord::Base
#   validates_uniqueness_of :title
#   validates_presence_of :title
#   validates_presence_of :content
#   
#   TYPES = ['idea','design','quote','essay']
# end

class Post
  include MongoMapper::Document

  key :title,     String
  key :url,       String
  key :slug,      String
  key :type,      String
  key :content,   String
  timestamps!

  # Validations.
  validates_uniqueness_of :title
  validates_presence_of :title, :content
  
  TYPES = ['idea','design','quote','essay']
  
  # Callbacks.
  after_validation_on_create :create_slug

  def self.find_by_slug(slug)
    first(:conditions => {:slug => slug})
  end

  def to_param
    self.slug || self.id
  end
  
  # Create a slug from the title.
  # From Sluggable Finder: http://github.com/ismasan/sluggable-finder/
  def convert_to_slug(str)
    if defined?(ActiveSupport::Inflector.parameterize)
      ActiveSupport::Inflector.parameterize(str).to_s
    else
      ActiveSupport::Multibyte::Handlers::UTF8Handler.
       normalize(str,:d).split(//u).reject { |e| e.length > 1 }.join.strip.gsub(/[^a-z0-9]+/i, '-').downcase.gsub(/-+$/, '')
    end
  end

  # Note: this slug creation code is vulnerable to race conditions.
  # Refactoring forthcoming.
  def create_slug
    return if self.title.blank?
    tail, int = "", 1
    initial   = convert_to_slug(self.title)
    while Post.find_by_slug(initial + tail) do 
      int  += 1
      tail = "-#{int}"
    end
    self.slug = initial + tail
  end
end