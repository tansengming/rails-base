class PagesController < ApplicationController
  VALID_PAGE_NAMES = I18n.t('.')[:pages][:show].keys.map(&:to_s)

  def show
    @page_name = params[:id]
    raise ActiveRecord::RecordNotFound unless VALID_PAGE_NAMES.include?(@page_name)
  end
end
