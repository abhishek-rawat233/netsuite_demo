env = Rails.env.to_sym
net_suite_credentials = Rails.application.credentials.dig(env, :netsuite)
# oauth does not work with API versions less than 2015_2
NetSuite.configure do
  reset!

  account          net_suite_credentials[:account]
  consumer_key     net_suite_credentials[:consumer_key]
  consumer_secret  net_suite_credentials[:consumer_secret]
  token_id         net_suite_credentials[:token_id]
  token_secret     net_suite_credentials[:token_secret]
  api_version      '2018_2'
  wsdl_domain      net_suite_credentials[:wsdl_domain]
end
