class CreateCalculationResults < ActiveRecord::Migration[7.1]
  def change
    create_table :calculation_results do |t|
      t.string :input_params
      t.text :result

      t.timestamps
    end
  end
end
