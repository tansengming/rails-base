class UpsController < ActionController::API
  respond_to :json

  def show
    ok = { status: :ok }
    respond_with ok
  end
end
