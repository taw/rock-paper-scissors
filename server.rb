# Requires the Gemfile
require 'bundler' ; Bundler.require

class Game
  attr_reader :player_a, :player_b, :choice_a, :choice_b

  def initialize(player_a, choice_a)
    @player_a = player_a
    @choice_a = choice_a
  end

  def finish(player_b, choice_b)
    @player_b = player_b
    @choice_b = choice_b
  end

  def finished?
    @player_b != nil
  end

  def winner
    {
      ["Rock", "Scissors"] => @player_a,
      ["Rock", "Paper"] => @player_b,
      ["Paper", "Rock"] => @player_a,
      ["Paper", "Scissors"] => @player_b,
      ["Scissors", "Paper"] => @player_a,
      ["Scissors", "Rock"] => @player_b,
    }[[@choice_a, @choice_b]] || "nobody"
  end
end

# needs to be saved between calls
active_game = nil
games = []

get '/wait_screen' do
  @game_id = params["game_id"].to_i
  @game = games[@game_id]
  if @game.finished?
    erb :game_finished
  else
    erb :wait_screen
  end
end

post '/make-choice' do
  @player = params["player"]
  @choice = params["choice"]
  if active_game
    active_game.finish(@player, @choice)
    @game = active_game
    active_game = nil
    erb :game_finished
  else
    @game_id = games.size
    active_game = Game.new(@player, @choice)
    games << active_game
    @game = active_game
    erb :wait_screen
  end
end

post '/join-game' do
  @player = params["player"]
  erb :make_choice
end

# By default Sinatra will return the string as the response.
get '/' do
  erb :index
end
