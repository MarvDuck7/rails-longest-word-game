require 'game_logic'

class GamesController < ApplicationController
  def game
    @grid = generate_grid(8)
    @start_time = Time.now
  end

  def score
    session[:nb_of_games] ? session[:nb_of_games] += 1 : session[:nb_of_games] = 1

    @attempt = params[:attempt]
    @grid = params[:grid].split('')
    @start_time = Time.parse(params[:start_time])
    @end_time = Time.now
    @result = run_game(@attempt, @grid, @start_time, @end_time)

    session[:scores] ? session[:scores] += @result[:score] : session[:scores] = @result[:score]

    @average_score = (session[:scores] / session[:nb_of_games]).round(1)

  end
end
