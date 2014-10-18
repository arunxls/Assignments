#!/usr/bin/ruby

require 'pp'

=begin

An anagram is a word obtained by rearranging the letters of another word.
For example, “rats”, “tars” and “star” are an anagram group because they are made up of the same letters.
Given an array of strings, write a method that groups them into anagram groups and returns the array of groups.
Case does not matter in classifying string as anagrams (but case should be preserved in the output),
and the order of the anagrams in the groups does not matter

=end

def combine_anagrams(words)
  word_hash = Hash.new
  words.each { |w|
    char = w.downcase.split(//).sort.join('')
    word_hash[char] ||= []
    word_hash[char].push(w)
  }
  return word_hash.values
end

pp combine_anagrams(['cars', 'for', 'potatoes', 'racs', 'four','scar', 'creams', 'scream'])