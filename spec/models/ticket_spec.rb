require 'spec_helper'

describe Ticket do
  # Works!
  it "creates nested assets" do
    ticket = Ticket.create(:title => "Assets galore!",
                           :description => "More than one!",
                           :assets_attributes => { "0" => { :asset => File.open("spec/fixtures/speed.txt") },
                                                   "1" => { :asset => File.open("spec/fixtures/spin.txt") }
                                                 }
                           )
  end
  
  #Fails!
  it "creates nested assets too" do
    ticket = Ticket.new(:title => "Assets galore!",
                           :description => "More than one!",
                           :assets_attributes => { "0" => { :asset => File.open("spec/fixtures/speed.txt") },
                                                   "1" => { :asset => File.open("spec/fixtures/spin.txt") }
                                                 }
                           )
    ticket.save
  end
end
