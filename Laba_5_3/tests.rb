
require 'minitest/autorun'
require_relative 'main'

class TestStringCorrection < Minitest::Test
  def test_correct_string
    assert_equal "коррекция строки для Это", correct_string("Это коррекция для строки")
    assert_equal "коррекция тестовая длинная строка", correct_string("тестовая коррекция длинная строка")
  end
end