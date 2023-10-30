require 'minitest/autorun'
require_relative 'main'

class TestSeriesCalculation < Minitest::Test
  def test_series_calculation
    result, iterations = calculate_series_with_precision(1e-4)
    assert_in_delta Math.cos(1), result, 1e-4

    result, iterations = calculate_series_with_precision(1e-6)
    assert_in_delta Math.cos(1), result, 1e-6
  end
end
