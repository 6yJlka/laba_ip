require 'minitest/autorun'
require_relative 'main'

class TestCalculateB < Minitest::Test
  def test_calculate_b_with_positive_value
    x = 3
    y = 4
    z = 0.5
    expected_result = (1 + Math.cos(y - 2)) / (x**4 + Math.sin(z)**2)
    assert_in_epsilon expected_result, calculate_b(x, y, z), 0.001
  end

  def test_calculate_b_with_negative_values
    x = -3
    y = -4
    z = -0.5
    expected_result = (1 + Math.cos(y - 2)) / (x**4 + Math.sin(z)**2)
    assert_in_epsilon expected_result, calculate_b(x, y, z), 0.001
  end
  def test_calculate_b_with_zero_values
    x = 0
    y = 0
    z = 0
    expected_result = Float::INFINITY
    assert_equal expected_result, calculate_b(x, y, z)
  end
end