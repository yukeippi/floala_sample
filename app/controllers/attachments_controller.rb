class AttachmentsController < ApplicationController
  skip_before_action :verify_authenticity_token
  
  def attach
    attachment = Attachment.new
    attachment.file = params[:file]
    attachment.save
    render json: {status: :ok, link: attachment.file.url}
  end

  def remove
    attachment = Attachment.find_by(id: params[:id])
    attachment.destroy
    render json: {status: :ok}
  end
end
