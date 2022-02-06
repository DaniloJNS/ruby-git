class Closure
  def initialize(*args, &block)
  end

  def self.call(*args, &block)
    block.call Closure.new
    puts block.methods
  end

  def name
    puts 'danilo'
  end
end
