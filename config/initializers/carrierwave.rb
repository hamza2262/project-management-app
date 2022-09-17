# frozen_string_literal: true

require ‘carrierwave/storage/abstract’
require ‘carrierwave/storage/file’
require ‘carrierwave/storage/fog’

  if Rails.env.staging? || Rails.env.production?
    CarrierWave.configure do |config|
     config.fog_provider = ‘fog/aws’
     config.fog_credentials = {
       provider: 'AWS',
       aws_access_key_id: ENV['S3_KEY'],
       aws_secret_access_key: ENV['S3_SECRET']
       # :region                 => ENV['S3_REGION'] # Change this for different AWS region. Default is 'us-east-1'
      }
     config.fog_directory = ENV['S3_BUCKET']
     config.storage = :fog
    end
  else
    config.storage = :file
    config.enable_processing = Rails.env.development?
  end
