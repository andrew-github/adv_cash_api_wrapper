require '../lib/soap_agent.rb'

api_name = "newapi"
api_key = "password"
system_account_name = "andrew"

auth = Authentication.new( api_name, api_key, system_account_name )
agent = SoapAgent.new auth
result = agent.get_balances

result.body.each { |object| puts "#{object[:id]} - #{object[:amount]}" }
