class CreatePalindromeCounts < ActiveRecord::Migration[7.1]
  def change
    create_table :palindrome_counts do |t|
      t.integer :n
      t.integer :square_n

      t.timestamps
    end
  end
end
