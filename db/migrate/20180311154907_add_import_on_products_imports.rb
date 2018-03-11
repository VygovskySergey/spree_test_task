class AddImportOnProductsImports < ActiveRecord::Migration[5.1]
  def change
    add_attachment :products_imports, :import
  end
end
