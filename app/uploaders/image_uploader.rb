# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  process :resize_to_limit => [700, 700]

  process :convert =>'jpg'

  version :thumb do
    process :resize_to_limit => [300,300]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    supoer.chomp(File.extname(super)) + '.jpg' if original_filename.present?
  end

  def filename
    time = Time.now
    name = time.strftime('%Y%m%d%H%M%S') + '.jpg'
    name.downcase
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
