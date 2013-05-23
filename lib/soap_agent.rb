class SoapAgent
  require 'savon'
  require 'date'
  require 'digest'

  def initialize auth
    @auth = auth
    @url = 'http://advcash.com:8080/wsm/merchantWebService?wsdl'
    @credentials = {}
  end

  def create_client
    @client = Savon.client( {:wsdl => @url} )
#    @credentials = {:api_name => @api_name, :authentication_token => @authentication_token, :system_account_name => @system_account_name}
    @credentials = {:api_name => @auth.api_name, :authentication_token => @auth.authentication_token, :system_account_name => @auth.system_account_name}
    @client.operations.each { |e| puts e }
    puts '************************************'
    puts @auth.api_name.inspect
    puts @auth.authentication_token.inspect
    puts @auth.system_account_name.inspect
    puts '************************************'
  end

  def validate_accounts accounts
    self.create_client
    begin
      return object_to_array @client.validate_accounts( {:arg0 => @credentials, :arg1 => accounts} ) # Need to rewrite
    rescue Exception => e
      raise e
    end
  end

  def get_balances
    self.create_client
    begin
      return @client.get_balances( {:arg0 => @credentials} )
    rescue Exception => e
      raise e
    end
  end

  def history filters
    self.create_client
    begin
      return @client.call( :history, :message => {:arg0 => @credentials, :arg1 => filters} ) #@client.history( {:arg0 => @credentials, :arg1 => filters} )
    resque Exception => e
      raise e
    end
  end

  def find_transaction transaction_id
    self.create_client
    begin
      return @client.find_transaction( {:arg0 => @credentials, :arg1 => transaction_id} )
    resque Exception => e
      raise e
    end
  end

  def make_currency_exchange( wallets, is_amount_in_src_wallet_currency )
    self.create_client
    begin
      return @client.make_currency_exchange( {:arg0 => @credentials, :arg1 => wallets, :arg2 => is_amount_in_src_wallet_currency} )
    resque Exception => e
      raise e
    end
  end

  def validate_currency_exchange( wallets, is_amount_in_src_wallet_currency )
    self.create_client
    begin
      return @client.validate_currency_exchange( {:arg0 => @credentials, :arg1 => wallets, :arg2 => is_amount_in_src_wallet_currency} )
    resque Exception => e
      raise e
    end
  end

  def make_transfer( type_of_transaction, wallets )
    self.create_client
    begin
      return @client.make_transfer( {:arg0 => @credentials, :arg1 => type_of_transaction, :arg2 => wallets} )
    resque Exception => e
      raise e
    end
  end

  def validate_transfer( type_of_transaction, wallets )
    self.create_client
    begin
      return @client.validate_transfer( {:arg0 => @credentials, :arg1 => type_of_transaction, :arg2 => wallets} )
    resque Exception => e
      raise e
    end
  end

end

class Authentication
  attr_accessor :api_name
  attr_accessor :authentication_token
  attr_accessor :system_account_name

  def initialize( api_name, api_key, system_account_name )
    @api_name = api_name
    @authentication_token = self.create_auth_token api_key
    @system_account_name = system_account_name
  end

  def create_auth_token api_key
    Digest::SHA256.hexdigest "#{api_key}:#{Date.today.strftime("%Y%m%d:%I")}"
  end
end
