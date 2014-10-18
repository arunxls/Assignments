#!/usr/bin/ruby

require 'pp'

=begin

A rock, paper, scissors tournament is encoded as a bracketed array of games - that is,
each element can be considered its own tournament.

  [
    [
      [ ["Kristen", "P"], ["Dave", "S"] ],
      [ ["Richard", "R"], ["Michael", "S"] ],
    ],

  ]
[
      [ ["Allen", "S"], ["Omer", "P"] ],
      [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
Under this scenario, Dave would beat Kristen (S>P), Richard would beat Michael (R>S),
and then Dave and Richard would play (Richard wins since R>S); similarly, Allen would beat Omer,
Richard X. would beat David E., and Allen and Richard X. would play (Allen wins since S>P);
and finally Richard would beat Allen since R>S, that is, continue until there is only a single winner.
    > Write a method rps_tournament_winner that takes a tournament encoded as a bracketed array and
      returns the winner (for the above example, it should return [“Richard”, “R”]).
    > Tournaments can be nested arbitrarily deep, i.e., it may require multiple rounds to get to a single winner.
      You can assume that the initial array is well formed (that is, there are 2N players, and each one
      participates in exactly one match per round).

=end

class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

class Array
  def is_play_tuple?
    (self[0].instance_of?(String) && self[1].instance_of?(String)) ? true : false
  end
end

def winner?(game)
  rules = {:S => 'R', :R => 'P', :P => 'S'}
  raise WrongNumberOfPlayersError unless game.length == 2
  game.each { |play| raise NoSuchStrategyError unless rules.keys.include?(play[1].to_sym)}
  return game.sort{ |a,b| rules[a[1].to_sym] == b[1] ? 1 : -1 }[0]
end

def rps_tournament_winner (tournament)
  return tournament if(tournament.is_play_tuple?)
  return winner?([rps_tournament_winner(tournament[0]),rps_tournament_winner(tournament[1])])
end


pp rps_tournament_winner(
  [
    [
      [ ["Kristen", "P"], ["Dave", "S"] ],
      [ ["Richard", "R"], ["Michael", "S"] ],
    ],
    [
      [ ["Allen", "S"], ["Omer", "P"] ],
      [ ["David E.", "R"], ["Richard X.", "P"] ]
    ]
  ]
)