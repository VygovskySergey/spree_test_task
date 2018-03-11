class ImportProductsWorker
  include Sidekiq::Worker

  def perform(products_import_id)
    ImportProductsService.call(products_import_id: products_import_id)
  end
end
