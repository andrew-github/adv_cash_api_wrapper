require '../lib/soap_agent.rb'

api_name = "newapi"
api_key = "password"
system_account_name = "andrew"

wallets = {:amount => 8.00, :dest_wallet_id => 'U993960083199', :src_wallet_id => 'U944079833602', :comment => 'test transfer transaction'}
type_of_transaction = ['TRANSFER_INNER_SYSTEM', 'TRANSFER_INNER_ACCOUNT']

auth = Authentication.new( api_name, api_key, system_account_name )
agent = SoapAgent.new auth

result = agent.make_transfer( type_of_transaction.first, wallets )

puts "Transaction ID: #{result.body[:make_transfer_response][:return]}"
