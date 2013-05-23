require '../lib/soap_agent.rb'

api_name = "newapi"
api_key = "password"
system_account_name = "andrew"

wallets = {:amount => 200.00, :dest_wallet_id => 'E060990630681', :src_wallet_id => 'U993960083199'} # Need to rewrite
is_amount_in_src_wallet_currency = false

auth = Authentication.new( api_name, api_key, system_account_name )
agent = SoapAgent.new auth

p agent.validate_currency_exchange( wallets, is_amount_in_src_wallet_currency ).body
