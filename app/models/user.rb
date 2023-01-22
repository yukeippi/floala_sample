class User < ApplicationRecord
  after_destroy :delete_attachments

  # memoに入っているimgタグから一致するattachmentを削除する
  def delete_attachments
    doc = Nokogiri::HTML.parse(self.memo, nil)
    doc.search("img").each do |e|
      src = e.attributes["src"].value
      src_ary = src.split("/")
      id   = src_ary[src_ary.length - 2] # id
      name = src_ary[src_ary.length - 1] # filename
      Attachment.where(id: id, file: name).destroy_all
    end
  end
end
