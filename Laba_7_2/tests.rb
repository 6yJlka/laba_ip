require_relative 'main'
require 'minitest/autorun'

class TestTriples < Minitest::Test
  def setup
    @triple = Triple.new(2, 3, '+')
    @triple_in_brackets = TripleInBrackets.new(4, 5, '*')
  end

  def test_triple_string
    assert_equal "2 + 3", @triple.string
  end

  def test_triple_result
    assert_equal 5, @triple.result
  end

  def test_triple_in_brackets_string
    assert_equal "(4 * 5)", @triple_in_brackets.string
  end

  def test_triple_in_brackets_result
    assert_equal 20, @triple_in_brackets.result
  end
end
