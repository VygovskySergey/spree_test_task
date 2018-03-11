class CreateProductsImports < ActiveRecord::Migration[5.1]
  def change
    create_table :products_imports do |t|
      t.string :state
      t.text   :errored_rows
    end
  end
end
