CarrierWave.configure do |config|
  if Rails.env.production?
    config.storage = :fog
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => 'AKIAVG3PPIMBXGNGRWOU',
      :aws_secret_access_key  => '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',
      :region                 => 'ap-northeast-1'
    }
    config.fog_directory  = 'backpackers418'
  end
end