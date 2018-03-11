require 'rails_helper'

describe ProductsImport do
  subject { products_import }

  describe 'validation' do
    context 'when have wrong import content type' do
      let(:wrong_import) { File.open(File.join(Rails.root, 'spec', 'fixtures', 'sample.jpg'))}
      let(:products_import) do
        build(:products_import, import: wrong_import)
      end

      it { should be_invalid }
      it 'should has correct error keys' do
        products_import.valid?

        expect(products_import.errors.keys).to include :import
        expect(products_import.errors.details[:import][0][:error]).to eq 'Unsupported file'
      end
    end
  end
end
