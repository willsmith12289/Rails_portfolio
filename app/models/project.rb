class Project < ActiveRecord::Base
  # has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/logo.png"
  # validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  mount_uploader :image, ImageUploader
end
