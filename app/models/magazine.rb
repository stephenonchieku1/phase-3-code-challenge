class Magazine
  attr_accessor :name, :category
   @@all =[]
   @@count=0
  def initialize(name, category)
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

end
