class User < ApplicationRecord
  after_destroy :delete_attachments
  before_save :set_attachment_ids

  # 保存時にコンテンツをチェックし、imageがあればidをセットしておく
  # froalaに直接imgタグを書くとエスケープされるので、ここでは検知されない。
  # したがって、imgたぐはすべてアップロード経由のものといえる
  def set_attachment_ids
    return if self.memo.blank?
    html = Nokogiri::HTML.parse(self.memo, nil)
    ids = html.search("img").map do |e|
      src = e.attributes["src"].value
      src_ary = src.split("/")
      src_ary[src_ary.length - 2] # id
    end
    self.attachment_ids = ids
  end

  def delete_attachments
    Attachment.where(id: self.attachment_ids).destroy_all
  end
end
