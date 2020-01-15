class Product

    attr_reader :name, :product_strength

@@all = []
def initialize(name)
    @name = name
    @product_strength = 1

    @@all << self
end

def self.all
    @@all
end

end