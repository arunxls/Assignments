#!/usr/bin/ruby

=begin

Write a method that determines whether a given word or phrase is a palindrome, that is
it reads the same backwards as forwards, ignoring case, punctuation, and nonword characters.
(characters that Ruby regexps would treat as nonword characters, that is, as boundaries between words).

=end

def palindrome? (string)
  filtered_string = string.downcase.gsub(/\W/,'')
  return filtered_string.reverse == filtered_string
end

puts palindrome?("A man, a plan, a canal -- Panama")
puts palindrome?("Madam, I'm Adam!")
puts palindrome?("Abracadabra")
puts palindrome?("In girum imus nocte et consumimur igni")