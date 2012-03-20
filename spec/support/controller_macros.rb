module ControllerMacros

  def login_user
    before(:each) do
      @request.env['devise.mapping'] = Devise.mappings[:user]
      user = FactoryGirl.create(:user)
      # A chamada abaixo pode ser substituída setando confirmed_at no factory.
      user.confirm!
      sign_in user
    end
  end
end
