class AssetsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:show]
  
  def show
    file_name = "#{params[:id]}.#{params[:format]}"
    asset_path = ActionController::Base.helpers.asset_path(file_name)
    file_path = "#{Rails.root}/public#{asset_path}"
    mime_type = Mime::Type.lookup_by_extension(params[:format])
    
    send_file(file_path, type: mime_type, disposition: "inline")
  end
end
