include '../lib/soap_agent.rb'

api_name = "newapi"
api_key = "password"
system_account_name = "andrew"

auth = Authentication.new( api_name, api_key, system_account_name )
agent = SoapAgent.new auth
result = objectToArray agent.getBalances # Need to rewrite

result[:return].each { |object| puts "#{object[:id]} - #{object[:amount]}" } # Need to rewrite
