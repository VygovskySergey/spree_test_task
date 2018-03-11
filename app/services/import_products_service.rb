class ImportProductsService
  def self.call(products_import_id:)
    products_import = ProductsImport.find(products_import_id)

    file_extension = File.extname(products_import.import.path)

    case file_extension
    when '.csv'
      ProductsImporters::CSV.new(products: products_import).import_products!
    else
      products_import.errored_rows = 'Unsupported file type'
      products_import.finish_with_errors!
    end
  end
end
