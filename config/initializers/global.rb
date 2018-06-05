class Global
  @@patch = '8.11.1'

  def self.api_key
    ENV['RIOT_API_KEY']
  end

  # this probably won't work well with rolling updates
  def self.patch
    @@patch
  end

  # TODO add region select
  def self.client
    @@client ||= Lol::Client.new(api_key, region: 'na', rate_limit_requests: 100, rate_limit_seconds: 120)
  end

  def self.static_client
    Lol::Client.new(api_key, region: 'na')
  end

end
