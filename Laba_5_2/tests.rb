require 'minitest/autorun'
require_relative 'main'

class TestDateConversion < Minitest::Test
  def test_iso_to_string
    assert_equal "15 июня 2009", iso_to_string("2009-06-15")
    assert_equal "10 марта 2022", iso_to_string("2022-03-10")
    assert_equal "25 декабря 2010", iso_to_string("2010-12-25")
  end
end