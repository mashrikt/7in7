# Print the string “Hello, world.”
puts 'Hello, world.'

# For the string “Hello, Ruby,” find the index of the word “Ruby.”
'Hello, Ruby' =~ /Ruby/
puts 'Hello, Ruby'.index('Ruby')

# Print your name ten times.
puts "Tahzib\n" * 10

# Print the string “This is sentence number 1,” where the number 1 changes from 1 to 10.
(1..10).each {|x| puts "This is sentence number #{x}"}

# Bonus problem: If you’re feeling the need for a little more, write a program that picks a random number. Let a player guess 
# the number, telling the player whether the guess is too low or too high.
ans = rand(10) + 1
puts "Guess a number between 1 to 10"
guess = gets.to_i

while guess != ans
  if guess < ans
    puts "Too Low"
  end
  if guess > ans
    puts "Too high"
  end
  puts "Try again!"
  guess = gets.to_i
end

puts "Winner winner chicken dinner!"
