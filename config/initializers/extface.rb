Extface.setup do |config|
  #config.redis_connection_string = "redis://username:password@my.host:6389"
  if Rails.env.production?
    config.redis_connection_string = "redis://example:#{ENV['OPENSHIFT_REDIS_DB_PASSWORD']}@#{ENV['OPENSHIFT_REDIS_DB_HOST']}:#{ENV['OPENSHIFT_REDIS_DB_PORT']}"
  end
  #config.device_timeout = 10 #seconds to wait before cancel the job if there is no activity on the device
end