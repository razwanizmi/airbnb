CarrierWave.configure do |config|
  config.fog_credentials = {
      :provider               => 'AWS',
      :aws_access_key_id      => ENV["AMAZON ACCESS KEY"],
      :aws_secret_access_key  => ENV["AMAZON SECRET KEY"],
      :region                 => 'ap-southeast-1' # Change this for different AWS region. Default is 'us-east-1'
  }
  config.fog_directory  = "razbnb"
end