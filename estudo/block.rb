class Block
  def initialize
    @a = []
  end
  def hello_world
    puts "Hello World"
  end
  def input text
    @a << text
  end
  def output 
    puts @a
  end
end
def block(&block)
  block.call Block.new
end
block do |block|
  block.hello_world
  block.input "teste"
  block.output
end
