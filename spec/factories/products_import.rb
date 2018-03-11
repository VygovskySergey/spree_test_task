FactoryBot.define do
  factory :products_import do
    import  File.open(File.join(Rails.root, 'spec', 'fixtures', 'sample.csv'))
  end
end
