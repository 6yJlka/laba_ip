require_relative 'root_finder'
require 'minitest/autorun'

class TestRootFinder < Minitest::Test
  def test_finding_maximum_negative_root_for_equation1
    equation1 = lambda { |x| -x**2 + Math.sin(x**2) }
    result = root_finder(equation1, 0.0001)
    assert_in_epsilon(-999.9, result, 0.0001)
  end

  def test_finding_maximum_negative_root_for_equation2
    equation2 = lambda { |x| x**5 + 3 * x**3 + x**2 + 1 }
    result = root_finder(equation2, 0.0001)
    assert_in_epsilon(-999.9, result, 0.0001)
  end
end
