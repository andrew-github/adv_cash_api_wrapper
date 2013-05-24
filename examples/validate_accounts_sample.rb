require '../lib/soap_agent.rb'

api_name = "newapi"
api_key = "password"
system_account_name = "andrew"
accounts = ['andrew', 'maxim', 'jnixable']

auth = Authentication.new( api_name, api_key, system_account_name )
agent = SoapAgent.new auth

result = agent.validate_accounts accounts

puts "Account presence:"
result.body[:validate_accounts_response][:return].each { |item| puts "#{item[:system_account_name]} - #{item[:present]}" }
