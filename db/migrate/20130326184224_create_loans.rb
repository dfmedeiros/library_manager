class CreateLoans < ActiveRecord::Migration
  def change
    create_table :loans do |t|
      t.boolean :returned, :default => false
      t.datetime :end_at
      t.datetime :returned_at
      t.references :book
      t.references :student
      t.references :employee

      t.timestamps
    end
  end
end
