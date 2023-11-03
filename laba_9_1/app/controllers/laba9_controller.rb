class Laba9Controller < ApplicationController
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
    
    respond_to do |format|
        format.html
        format.js
    end
  end
end
