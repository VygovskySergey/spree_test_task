FactoryBot.define do
  factory :products_import do
    import  File.open(File.join(Rails.root, 'sample.csv'))
  end
end
