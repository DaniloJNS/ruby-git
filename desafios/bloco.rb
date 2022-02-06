def return_binding
  foo = 1000
  binding
end
def test_block
  
end


puts return_binding.class
puts return_binding.eval('foo')
