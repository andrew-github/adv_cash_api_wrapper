class SoapAgent
  require 'savon'
  require 'date'
  require 'digest'

  WSDL_URL  = 'http://advcash.com:8080/wsm/merchantWebService?wsdl'
  NAMESPACE = 'http://wsm.system.finance.pro/'

  def initialize auth
    @auth = auth
    @credentials = {}
  end

  def create_client
    @client = Savon.client( {:wsdl => WSDL_URL, :namespace => NAMESPACE} )
    @credentials = {:api_name => @auth.api_name, :authentication_token => @auth.authentication_token, :system_account_name => @auth.system_account_name}
  end

  def validate_accounts accounts
    self.create_client
    begin
      @client.call( :validate_accounts, :message => {:arg0 => @credentials, :arg1 => accounts} )
    rescue Exception => e
      raise e.message
    end
  end

  def get_balances
    self.create_client
    begin
      @client.call( :get_balances, :message => {:arg0 => @credentials} )
    rescue Exception => e
      raise e.message
    end
  end

  def history filters
    self.create_client
    begin
      @client.call( :history, :message => {:arg0 => @credentials, :arg1 => filters} )
    rescue Exception => e
      raise e.message
    end
  end

  def find_transaction transaction_id
    self.create_client
    begin
      @client.call( :find_transaction, :message => {:arg0 => @credentials, :arg1 => transaction_id} )
    rescue Exception => e
      raise e.message
    end
  end

  def make_currency_exchange( wallets, is_amount_in_src_wallet_currency )
    self.create_client
    begin
      @client.call( :make_currency_exchange, :message => {:arg0 => @credentials, :arg1 => wallets, :arg2 => is_amount_in_src_wallet_currency} )
    rescue Exception => e
      raise e.message
    end
  end

  def validate_currency_exchange( wallets, is_amount_in_src_wallet_currency )
    self.create_client
    begin
      @client.call( :validate_currency_exchange, :message => {:arg0 => @credentials, :arg1 => wallets, :arg2 => is_amount_in_src_wallet_currency} )
    rescue Exception => e
      raise e.message
    end
  end

  def make_transfer( type_of_transaction, wallets )
    self.create_client
    begin
      @client.call( :make_transfer, :message => {:arg0 => @credentials, :arg1 => type_of_transaction, :arg2 => wallets} )
    rescue Exception => e
      raise e.message
    end
  end

  def validate_transfer( type_of_transaction, wallets )
    self.create_client
    begin
      @client.call( :validate_transfer, :message => {:arg0 => @credentials, :arg1 => type_of_transaction, :arg2 => wallets} )
    rescue Exception => e
      raise e.message
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
    Digest::SHA256.hexdigest "#{api_key}:#{DateTime.now.new_offset(0).strftime("%Y%m%d:%k")}"
  end
end
