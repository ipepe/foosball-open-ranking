class Api::OpenController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :check_webapi_key
  respond_to :json

  private

  def check_webapi_key
    unless params["apikey"].present? && User.where(apikey: params["apikey"]).exists?
      raise ActiveRecord::RecordNotFound
    end
  end
end