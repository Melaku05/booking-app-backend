class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :name
      t.text :detail
      t.string :photo
      t.string :city
      t.string :specialization
      t.float :fee

      t.timestamps
    end
  end
end
