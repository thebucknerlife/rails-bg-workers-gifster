class Gif < ActiveRecord::Base

  attr_accessor :remote_image_url

  mount_uploader :image, ImageUploader

  belongs_to :user

  validates_presence_of :title, :user

  def attach_image(params)
    if params[:image]
      image = params[:image]
    elsif params[:remote_image_url]
      remote_image_url = params[:remote_image_url]
    else
      errors.add(:image, 'must be included')
    end
  end

end
