include '../lib/soap_agent.rb'

api_name = "newapi"
api_key = "password"
system_account_name = "andrew"
transaction_id = '0735b5ae-3e90-4cd1-9c5d-a07bac1f7833'

auth = Authentication.new( api_name, api_key, system_account_name )
agent = SoapAgent.new auth

result = objectToArray agent.find_transaction transaction_id # Need to rewrite
object = result[:return]

pp object.to_json
