if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: ENV['AKIAVG3PPIMBXGNGRWOU'],
      aws_secret_access_key: ENV['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'],
      region: 'ap-northeast-1'
    }
    config.fog_directory  = 'backpackers418'
  end