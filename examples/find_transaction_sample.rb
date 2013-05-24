require '../lib/soap_agent.rb'

api_name = "newapi"
api_key = "password"
system_account_name = "andrew"
transaction_id = 'f6d6ea5e-9c46-4a34-b15c-5e0be3c9d313'

auth = Authentication.new( api_name, api_key, system_account_name )
agent = SoapAgent.new auth

result = agent.find_transaction transaction_id
item = result.body[:find_transaction_response][:return]

puts "<table border='1'>
        <tr>
          <th>Transaction ID</th>
          <th>Transaction Name</th>
          <th>Start Date</th>
          <th>Status</th>
          <th>Wallet Dest</th>
          <th>Amount</th>
          <th>Amount in USD</th>
          <th>Activity Level</th>
          <th>Commission</th>
          <th>Comment</th>
        </tr>"
  puts "<tr>
          <td>#{item[:id]}</td>
          <td>#{item[:transaction_name]}</td>
          <td>#{item[:start_time]}</td>
          <td>#{item[:status]}</td>
          <td>#{item[:wallet_dest_id]}</td>
          <td>#{item[:amount]}</td>
          <td>#{item[:amount_in_usd]}</td>
          <td>#{item[:activity_level]}</td>
          <td>#{item[:full_commission]}</td>
          <td>#{item[:comment]}</td>
        </tr>"
puts "</table>"
