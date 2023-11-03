class PalindromeCount < ApplicationRecord
    def is_palindrome?(number)
        number.to_s == number.to_s.reverse
    end
end
