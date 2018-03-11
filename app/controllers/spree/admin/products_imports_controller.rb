class Spree::Admin::ProductsImportsController < Spree::Admin::BaseController

  def index
    @products_imports = ProductsImport.all
  end

  def create
    @products_import = ProductsImport.new(products_import_params)

    if @products_import.save
      ImportProductsWorker.perform_async(@products_import.id)
      flash[:notice] = 'File is waiting for process'
    else
      flash[:error] = @products_import.errors.full_messages
    end

    redirect_to admin_products_imports_url
  end

  private

  def products_import_params
    params.fetch(:products_import, {}).permit(:import)
  end
end
