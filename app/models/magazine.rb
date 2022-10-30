class Magazine
  attr_accessor :name, :category
   @@all =[]
   @@count=0
  def initialize(name:, category:)
    @name = name
    @category = category
     @@count =+1
     @@all << self
  end

  def self.count
  @@count
  end
  
  def self.all
    @@all
  end

  def articles
    Article.all.filter {|article|article.magazine == self}
  end
  def articles_titles
    self.articles.map{|articles|article.title}
  end
  def contributors
    self.articles.map{|article|article.author}.uniq
  end
  def contributing_authors
    self.contibutors.filter{|author|author.articles.count >2}
  end
  
  def self.find_by_name(name)
    self.all.find do |magazine|
      magazine.name ==name
    end
  end

end
