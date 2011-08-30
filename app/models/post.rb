class Post
  
  include ActiveModel::Validations
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  include ActiveModel::MassAssignmentSecurity
  
  attr_accessible :name, :text
  attr_accessor :name, :text, :title
  
  def initialize hash
    hash.each do |k,v|
      instance_variable_set :"@#{k}", v
    end
  end
  
  def self.all
    Dir['db/posts/*.md'].collect do |f|
      self.create_from_file(f)
    end.compact
  end
  
  def self.create_from_file(f)
    Post.new name: File.basename(f,'.md'), text: IO.read(f) unless File.basename(f) =~ /^_/
  end
  
  def self.find(id)
    if f = Dir["db/posts/#{id}.md"].first
      self.create_from_file(f)
    end
  end
    
  def date
    DateTime.parse name[0..10]
  end
  
  def title
    name.gsub('-',' ')[11..-1]
  end
  
  def to_param
    name
  end
  
  def to_s
    name
  end
  
end