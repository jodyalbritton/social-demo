CarrierWave.configure do |config|
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.fog_credentials = {
    :provider               => 'AWS',       # required
    :aws_access_key_id      => 'AKIAJGWQUOSGLSWHCRJA',       # required
    :aws_secret_access_key  => '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'}      # required
  config.fog_directory = 'socialdemo'
end

