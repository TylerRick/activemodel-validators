require 'spec_helper'

describe 'test that config/locales/en.yml is being loaded' do
  it { I18n.t(:'activerecord.errors.messages.must_be_blank').should == 'must be blank' }
  it { I18n.t( :'activemodel.errors.messages.must_be_blank').should == 'must be blank' }
end

describe Response do
  'must be greater than or equal to 1'.tap do |message|
    it { should_not allow_value(0).for(:how_many_people).with_message(message) }
  end
end
