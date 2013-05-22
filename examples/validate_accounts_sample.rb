include '../lib/soap_agent.rb'

api_name = "newapi"
api_key = "password"
system_account_name = "andrew"
accounts = ['andrew', 'maxim', 'jnixable']

auth = Authentication.new( api_name, api_key, system_account_name )
agent = SoapAgent.new auth

result = objectToArray agent.validate_accounts accounts # Need to rewrite

result[:return].each { |object| puts "#{object[:system_account_name]} - #{object[:present]}" } # Need to rewrite
