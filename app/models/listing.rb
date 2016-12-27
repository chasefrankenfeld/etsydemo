class Listing < ApplicationRecord

  # Paperclip requirements
  if Rails.env.development?
    has_attached_file :image, styles: { medium: "300x>", thumb: "100x100>" }, default_url: "default.jpg"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  else
    has_attached_file :image, styles: { medium: "300x>", thumb: "100x100>" }, default_url: "default.jpg",
      storage: :dropbox,
      dropbox_credentials: Rails.root.join("config/dropbox.yml"),
      path: ":style/:id_:filename"
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  end

  # Validations
  validates :name, :description, :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :image, attachment_presence: true

  # Relationships
  belongs_to :user

end
