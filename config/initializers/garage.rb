Garage.configure {}
Garage::TokenScope.configure do
  register :public, desc: 'acessing publicly available data' do
    access :read, User
    access :write, User
  end
end

Doorkeeper.configure do
  orm :active_record
  default_scopes :public
  optional_scopes(*Garage::TokenScope.optional_scopes)

  resource_owner_from_credentials do |routes|
    p params
    u = User.find_by(:email => params[:email])
    u if u && u.authenticate(params[:password])
  end
end

Doorkeeper.configuration.token_grant_types << "password"
