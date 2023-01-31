require 'test/unit'
require_relative 'app'

class AppTest < Test::Unit::TestCase

  def setup
  end

  def test_add
    assert_equal(7, add(4, 3))
  end

  # def test_add_string
  #   assert_equal("7abc", add(7, "abc"))
  # end

  def test_add_string
    assert_equal("abc", add("a", "bc"))
  end

  def test_add_numbers_exception
    assert_raise(ArgumentError.new("Expected a value of numbers")) {add_numbers(7, "b")}
    assert_raise(ArgumentError.new("Expected a value of numbers")) {add_numbers("b", 7)}
    assert_raise(ArgumentError.new("Expected a value of numbers")) {add_numbers("a", "b")}
    assert_raise(ArgumentError.new("Expected a value of numbers")) {add_numbers("7", 7)}
    assert_raise(ArgumentError.new("Expected a value of numbers")) {add_numbers(7, "7")}
    assert_raise(ArgumentError.new("Expected a value of numbers")) {add_numbers("7", "7")}
  end

  

end