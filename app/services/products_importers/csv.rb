require 'csv'

class ProductsImporters::CSV < BaseProductsImporter

  def import_products!
    products.process!

    ::CSV.foreach(products.import.path, col_sep: ';', skip_blanks: true, headers: true) do |row|
      begin
        next if row.to_h.compact.blank?
        product = product_importer.new(product_attributes: row.to_h.compact)
        product.import!
      rescue Exception => e
        products.errored_rows = "" if products.errored_rows.blank?
        products.errored_rows << "Errored row: #{product.product_attributes.values.join(';')}; Error: #{e} \n"
      end
    end

    if products.errored_rows.present?
      products.finish_process_with_errors!
    else
      products.finish_process!
    end
  end

  def product_importer
    ProductImporters::CSVRow
  end
end
