class BaseProductsImporter
  attr_accessor :products

  def initialize(products:)
    @products = products
  end

  def import_products!
    raise NotImplementedError
  end

  def product_importer
    raise NotImplementedError
  end
end
