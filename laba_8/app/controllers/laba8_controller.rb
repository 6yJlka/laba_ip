class Laba8Controller < ApplicationController
    def index
    end

    def calculate
      n = params[:n].to_i
      @palindromes = []

      (1..n).each do |i|
        square = i * i
        @palindromes << { number: i, square: square } if PalindromeCount.new.is_palindrome?(square)
      end

      @count = @palindromes.size
    end
end
  