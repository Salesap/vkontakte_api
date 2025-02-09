require 'spec_helper'

describe VkontakteApi::Resolvable do
  before(:each) do
    @class = Class.new do
      include VkontakteApi::Resolvable
    end
  end
  
  describe "#initialize" do
    it "saves the name and the resolver" do
      resolver   = OpenStruct.new(token: 'token')
      resolvable = @class.new(:name, resolver: resolver)
      
      expect(resolvable.name).to  eq('name')
      expect(resolvable.token).to eq('token')
    end
  end
end
