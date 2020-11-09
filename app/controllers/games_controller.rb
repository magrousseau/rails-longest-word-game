require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = ('A'..'Z').to_a.sample(10)
  end

  def score
    @word = params[:word]
    url = open("https://wagon-dictionary.herokuapp.com/#{@word}").read
    validation = JSON.parse(url)
    if validation["found"] == false
      @message = "Sorry but #{@word} does not seem to be a valid English word..."
      @score = 0
    elsif @word.chars.any? { |char| @word.chars.count(char) > params[:letters].count(char.upcase) }
      @message = "The word can’t be built out of the given letters"
      @score = 0
    else
      @message = "Congratulations #{@word} is a valid English word!"
      @score = @word.length.to_i ** 2
    end
  end
end
