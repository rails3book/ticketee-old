require 'spec_helper'

describe Account do
  let(:account) { Factory(:account) }
  
  it "admins" do
    admin = Factory(:user)
    user = Factory(:user)
    account.users << admin
    account.users << user
    
    account_user = AccountUser.find_by_account_id_and_user_id(account.id, admin.id)
    account_user.update_attribute(:admin, true)
    
    account.admins.include?(user).should be_false
    account.admins.include?(admin).should be_true
  end
end