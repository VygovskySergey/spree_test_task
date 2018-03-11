class ProductImporters::CSVRow < BaseProductImporter

  def import!
    prepare_product_attributes
    Spree::Product.create!(@product_attributes)
  end

  private

  def prepare_product_attributes
    @product_attributes["price"].gsub!(',', '.')
    @product_attributes["available_on"]      = DateTime.parse(@product_attributes.delete("availability_date"))
    @product_attributes["shipping_category"] = Spree::ShippingCategory.find_or_create_by(name: @product_attributes.delete("category").downcase)

    @product_attributes.select! { |attribute| Spree::Product.attribute_method?(attribute)}
  end
end
