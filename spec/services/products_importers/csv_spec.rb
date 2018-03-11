require 'rails_helper'

describe ProductsImporters::CSV do
  describe '#import_products!' do
    context 'with valid import file' do
      let(:products_import) { create(:products_import) }

      it 'successfully imports products' do
        service = ProductsImporters::CSV.new(products: products_import)
        service.import_products!

        expect(Spree::Product.count).to eq 3

        expect(products_import.processed?).to   be_truthy
        expect(products_import.errored_rows).to be_nil
      end
    end
  end
end
