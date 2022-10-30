class Author
  attr_accessor :name
   @@all=[]

  def initialize(name)
    @name = name
    @@all<<self
  end
  def self.all
    @@all
  end
  
  def articles
    Article.all.filter{|article|article.author == self}
  end
  def magazines
    self.articles.map do |article|
      article.magazine
    end.uniq
  end
  def add_article(title,magazine_name,magazine_category)
    Article.new(self,title,magazine_name,magazine_category)
  end
  def topic_areas
    self.magazine.map{|magazine|magazine.category}.uniq
  end


  
end
