#!/usr/bin/ruby

require 'pp'

=begin

In a game of rock-paper-scissors, each player chooses to play Rock (R), Paper (P), or Scissors (S).
The rules are: Rock beats Scissors (R>S), Scissors beats Paper (S>P), but Paper beats Rock (P>R).
A rock-paper-scissors game is encoded as a list, where each list element is a two-element list
that encodes a player’s name and a player’s strategy.

=end

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_game_winner(game)
  # Here we store the values for which each of the 'strategies' would lose
  rules = {'S' => 'R', 'R' => 'P', 'P' => 'S'}

  #Raise exceptions
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each { |play| raise NoSuchStrategyError unless(rules.keys.include?(play[1])) }

  # Sort the array based on the priority of the strategies. Return the first element, which is the winner
  return game.sort{ |a,b| rules[a[1]] == b[1] ? 1 : -1 }[0]
end

pp rps_game_winner([ [ "Kristen", "P" ], [ "Pam", "S" ] ] )
