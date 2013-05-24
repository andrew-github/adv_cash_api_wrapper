require '../lib/soap_agent.rb'

api_name = "newapi"
api_key = "password"
system_account_name = "andrew"

auth = Authentication.new( api_name, api_key, system_account_name )
agent = SoapAgent.new auth
result = agent.get_balances

puts "<table border='1'>
        <tr>
          <th>ID</th>
          <th>Amount</th>
        </tr>"
result.body[:get_balances_response][:return].each do |object|
  puts "<tr>
          <td>#{object[:id]}</td>
          <td>#{object[:amount]}</td>
        </tr>"
end
puts "</table>"
