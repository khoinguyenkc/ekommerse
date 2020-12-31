class AddDatesToReviews < ActiveRecord::Migration[6.0]
  def change
    add_column :reviews, :created_at, :datetime, null: false
    add_column :reviews, :updated_at, :datetime, null: false

  end
end
