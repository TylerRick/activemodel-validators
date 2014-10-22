require 'spec_helper'

describe 'test that config/locales/en.yml is being loaded' do
  it { I18n.t(:'errors.messages.must_be_blank').should == 'must be blank' }
end

describe Response do
  it { should_not allow_value(0).for(:how_many_people).with_message('must be greater than or equal to 1') }
  it { should     allow_value(1).for(:how_many_people) }

  it { should_not allow_value(0).for(:how_many_pies).  with_message('must be at least 1') }
  it { should     allow_value(1).for(:how_many_pies) }

  it { subject.how_many_people = 5
       should_not allow_value(0).for(:how_many_gifts).  with_message('must be equal to How many people (5)') }
end
