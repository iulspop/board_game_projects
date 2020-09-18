# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

=begin
It will print:
1
2
2
3
The `uniq` method call on line 4 doesn't mutate the caller.
Puts calls `to_s` on it's arguments, so the array elements will each be printed
on one line.
=end