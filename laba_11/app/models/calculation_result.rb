class CalculationResult < ApplicationRecord
    validates :input_params, uniqueness: true
end
  