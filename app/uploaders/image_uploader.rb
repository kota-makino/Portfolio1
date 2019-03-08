class ImageUploader < CarrierWave::Uploader::Base

  def extension_white_list
    %w[jpg jpeg png]
  end

  def size_range
    1..10.megabytes
  end  

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

end
