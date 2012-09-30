CarrierWave.configure do |config|
    
    
    

   

  
  if Rails.env.production?
  config.storage = :fog
  config.cache_dir = 'carrierwave'
  config.root = Rails.root.join('tmp')
  config.fog_directory = 'socialdemo'
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJGWQUOSGLSWHCRJA',       # required
    :aws_secret_access_key  => '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'}      # required
 
  else
    config.storage = :file
  end
end

