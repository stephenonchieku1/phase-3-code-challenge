# Please copy/paste all three classes into this file to submit your solution!
class Article
    attr_accessor :author,:magazine, :title
    @@all = []
    def initialize(author,magazine,title)
        @author = author
        @magazine = magazine
        @title = title
        @@all << self
    end
    def self.all
        @@all
    end


end

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
    