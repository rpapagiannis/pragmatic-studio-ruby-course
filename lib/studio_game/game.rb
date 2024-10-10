# frozen_string_literal: true

require_relative 'treasure_trove'

# game class
class Game
  attr_reader :title, :players

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players.push(player)
  end

  def play(rounds = 1) # rubocop:disable Metrics/MethodLength,Metrics/AbcSize
    puts "\nLet's play #{@title}"

    puts "\nThe following treasures can be found:"
    puts TreasureTrove.treasure_items
    puts

    puts "\nBefore playing:"
    puts @players

    1.upto(rounds) do |round|
      puts "\nRound #{round}"

      @players.each do |player|
        number_rolled = roll_die

        case number_rolled
        when 1..2
          player.drain
          puts "#{player.name} got drained 😩"
        when 3..4
          puts "#{player.name} got skipped"
        else
          player.boost
          puts "#{player.name} got boosted 😁"
        end

        treasure_found = TreasureTrove.random_treasure
        player.found_treasure(treasure_found.name, treasure_found.points)
        puts "#{player.name} found a #{treasure_found.name} worth #{treasure_found.points}"
      end
    end
  end

  def roll_die
    rand(1..6)
  end

  def print_stats # rubocop:disable Metrics/MethodLength
    puts "\n#{@title} Game Stats:"
    puts '-' * 30
    puts sorted_players

    @players.each do |player|
      puts "\n#{player.name}'s treasure points totals:"
      player.found_treasures.each do |treasure, points|
        puts "#{treasure}: #{points}"
      end
    end

    puts "\nHigh Scores:"
    sorted_players.each do |player|
      puts high_score_entry(player)
    end
  end

  def sorted_players
    @players.sort_by { |player| player.score }.reverse # rubocop:disable Style/SymbolProc
  end

  def load_players(from_file)
    File.readlines(from_file, chomp: true).each do |line|
      player = Player.from_csv(line)
      add_player(player)
    end
  end

  def save_high_scores(to_file = 'high_scores_txt')
    File.open(to_file, 'w') do |file|
      file.puts "#{@title} High Scores:"
      sorted_players.each do |player|
        file.puts high_score_entry(player)
      end
    end
  end

  def high_score_entry(player)
    name = player.name.ljust(20, '.')
    points = player.score.round.to_s.rjust(5)
    "#{name}#{points}"
  end
end
