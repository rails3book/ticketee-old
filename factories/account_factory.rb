Factory.define(:account) do |account|
  account.name { "account-#{rand(10000)}" }
  account.path { "account-#{rand(10000)}" }
end