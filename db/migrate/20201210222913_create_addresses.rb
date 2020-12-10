class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :recipient_name
      t.string :street
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :country
    end
  end
end
