require '../lib/soap_agent.rb'

api_name = "newapi"
api_key = "password"
system_account_name = "andrew"

wallets = {:amount => 20.00, :dest_wallet_id => 'U000000000000', :src_wallet_id => 'U993960083199', :comment => 'test exchange transaction'} # Need to rewrite
type_of_transaction = ['TRANSFER_INNER_SYSTEM', 'TRANSFER_INNER_ACCOUNT']

auth = Authentication.new( api_name, api_key, system_account_name )
agent = SoapAgent.new auth

result = agent.make_transfer( type_of_transaction.first, wallets )

p result.body
