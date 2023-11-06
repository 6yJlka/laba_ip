# test/models/palindrome_count_test.rb
require 'test_helper'

class PalindromeCountTest < ActiveSupport::TestCase
  test "should return true for palindromic number" do
    pc = PalindromeCount.new
    result = pc.is_palindrome?(121)
    assert result, "Expected true for a palindromic number"
  end

  test "should return false for non-palindromic number" do
    pc = PalindromeCount.new
    result = pc.is_palindrome?(123)
    assert_not result, "Expected false for a non-palindromic number"
  end
end
