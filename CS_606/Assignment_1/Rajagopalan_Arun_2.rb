#!/usr/bin/ruby

require 'pp'

=begin

Given a string of input, return a hash whose keys are words in the string
and whose values are the number of times each word appears. Do not use
for-loops. Iterators such as each are permitted. Nonwords should be ignored.
Case should not matter. A word is defined as a string of characters between word boundaries.
(“\b” in a Ruby regexp means matches word boundaries)

=end

def count_words(string)
  count_hash = Hash.new
  string.downcase.gsub(/\W/,' ').split(/ /).each { |str|
    unless str == ''
      if count_hash.has_key?(str)
        count_hash[str] = count_hash[str] + 1
      else
        count_hash[str] = 1
      end
    end
  }
  return count_hash
end

pp count_words("A man, a plan, a canal -- Panama") # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
pp count_words "Doo bee doo bee doo"  # => {'doo' => 3, 'bee' => 2}

