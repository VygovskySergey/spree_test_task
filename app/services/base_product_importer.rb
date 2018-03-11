class BaseProductImporter
  attr_accessor :product_attributes

  def initialize(product_attributes:)
    @product_attributes = product_attributes
  end
end
