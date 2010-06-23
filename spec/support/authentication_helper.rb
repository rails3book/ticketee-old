def stub_warden
  @warden = OpenStruct.new
  request.env['warden'] = @warden
end

def sign_in_as(user)
  @warden.should_receive(:authenticate!).with(:scope => :user)
  controller.stub!(:current_user).and_return(user)
end
