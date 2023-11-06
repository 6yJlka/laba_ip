require 'test_helper'

class CalculationResultTest < ActiveSupport::TestCase
  test "should not save a result with the same input_params" do
    result = CalculationResult.new(input_params: "your_input_params", result: "your_result")
    result.save

    duplicate_result = CalculationResult.new(input_params: "your_input_params", result: "your_duplicate_result")

    assert_not duplicate_result.save, "Duplicate result was saved."
  end

  test "should not save a result with the same input_params JSON" do
    result1 = CalculationResult.create(input_params: { n: 100 }.to_json, result: [].to_json)
    result2 = CalculationResult.new(input_params: { n: 100 }.to_json, result: [].to_json)
    assert_not result2.save
  end
end
