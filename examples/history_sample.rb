require '../lib/soap_agent.rb'

api_name = "newapi"
api_key = "password"
system_account_name = "andrew"

types = [
	'ALL',                    # 0
	'CHECK_DEPOSIT',          # 1
	'WIRE_TRANSFER_DEPOSIT',  # 2
	'WIRE_TRANSFER_WITHDRAW', # 3
	'CHECK_WITHDRAW',         # 4
	'INNER_ACCOUNT',          # 5
	'INNER_SYSTEM',           # 6
	'CURRENCY_EXCHANGE',      # 7
	'MONEY_REQUEST'           # 8
]

status = [
	'ALL',                    # 0
	'PENDING',                # 1
	'PROCESS',                # 2
	'COMPLETED',              # 3
	'CANCELED',               # 4
	'NOT_IDENTIFIED',         # 5
	'ERROR'                   # 6
]

filters = {
	:transaction_name   => types.first,
	:transaction_status => status.first
}

auth = Authentication.new( api_name, api_key, system_account_name )
agent = SoapAgent.new auth

result = agent.history filters
object = result.body

p object.to_json
