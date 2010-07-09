require 'spec_helper'

describe Ticket do
  it "creates nested assets" do
    ticket = Ticket.create(:title => "Assets galore!",
                           :description => "More than one!",
                           :assets_attributes => { "0" => { :asset => File.open("spec/fixtures/speed.txt") },
                                                   "1" => { :asset => File.open("spec/fixtures/spin.txt") }
                                                 }
                           )
    ticket.assets.count.should eql(2)
  end
end
