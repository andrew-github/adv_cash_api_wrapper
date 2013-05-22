class SoapAgent

  def initialize auth
    @auth = auth
    @url = 'http://192.168.15.36:8080/wsm/merchantWebService?wsdl' #http://advcash.com:8080/wsm/merchantWebService?wsdl
    @array_credentials = {}
  end

  def create_client
    @client = SoapClient.new @url # Need to rewrite
    @array_credentials = {:api_name => @auth.api_name, :authentication_token => @auth.authentication_token, :system_account_name => @auth.system_account_name}
  end

  def validate_accounts accounts
    self.create_client
    begin
      return object_to_array @client.validate_accounts( {:arg0 => @array_credentials, :arg1 => accounts} ) # Need to rewrite
    rescue Exception => e
      raise e
    end
  end

  def get_balances
    self.create_client
    begin
      return @client.get_balances( {:arg0 => @array_credentials} )
    rescue Exception => e
      raise e
    end
  end

  def history filters
    self.create_client
    begin
      return @client.history( {:arg0 => @array_credentials, :arg1 => filters} )
    resque Exception => e
      raise e
    end
  end

  def find_transaction transaction_id
    self.create_client
    begin
      return @client.find_transaction( {:arg0 => @array_credentials, :arg1 => transaction_id} )
    resque Exception => e
      raise e
    end
  end

  def make_currency_exchange( wallets, is_amount_in_src_wallet_currency )
    self.create_client
    begin
      return @client.make_currency_exchange( {:arg0 => @array_credentials, :arg1 => wallets, :arg2 => is_amount_in_src_wallet_currency} )
    resque Exception => e
      raise e
    end
  end

  def validate_currency_exchange( wallets, is_amount_in_src_wallet_currency )
    self.create_client
    begin
      return @client.validate_currency_exchange( {:arg0 => @array_credentials, :arg1 => wallets, :arg2 => is_amount_in_src_wallet_currency} )
    resque Exception => e
      raise e
    end
  end

  def make_transfer( type_of_transaction, wallets )
    self.create_client
    begin
      return @client.make_transfer( {:arg0 => @array_credentials, :arg1 => type_of_transaction, :arg2 => wallets} )
    resque Exception => e
      raise e
    end
  end

  def validate_transfer( type_of_transaction, wallets )
    self.create_client
    begin
      return @client.validate_transfer( {:arg0 => @array_credentials, :arg1 => type_of_transaction, :arg2 => wallets} )
    resque Exception => e
      raise e
    end
  end

end
