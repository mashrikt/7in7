# Print the contents of an array of sixteen numbers, four numbers
# at a time, using just each. Now, do the same with each_slice in
# Enumerable.
num = (1..16).to_a
num.each do |i| 
  puts "#{num[i-1, 4]}" if i % 4 == 1
end

num.each_slice(4) { |slice| p slice }


# The Tree class was interesting, but it did not allow you to specify
# a new tree with a clean user interface. Let the initializer accept a
# nested structure with hashes and arrays. You should be able to
# specify a tree like this: {’grandpa’ => { ’dad’ => {’child 1’ => {}, ’child
# 2’ => {} }, ’uncle’ => {’child 3’ => {}, ’child 4’ => {} } } }.
class Tree2
  attr_accessor :children, :node_name

  def initialize(data)
    @children = []
    @node_name = data.first[0]
    data.first[1].each do |elem|
      children << Tree2.new({elem[0] => elem[1]})
    end
  end 

  def visit_all(&block)
    visit &block
    children.each {|c| c.visit_all &block}
  end
  
  def visit(&block)
    block.call self
  end
end

data = {"grandpa"=>{"dad"=>{"child 1"=>{}, "child 2"=>{}}, "uncle"=>{"child 3"=>{}, "child 4"=>{}}}}

ruby_tree = Tree2.new(data)

puts "Visiting a node"
ruby_tree.visit {|node| puts node.node_name}
puts

puts "\n\nvisiting entire tree"
ruby_tree.visit_all {|node| puts node.node_name}


# Write a simple grep that will print the lines of a file having any
# occurrences of a phrase anywhere in that line. You will need to do
# a simple regular expression match and read lines from a file. (This
# is surprisingly simple in Ruby.) If you want, include line numbers.
file_name = "sample.txt"
phrase = /file/

File.open(file_name).each_with_index do |line, index|
  p "#{index} #{line.rstrip}"
end
