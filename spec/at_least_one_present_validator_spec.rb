require 'spec_helper'

      ActiveModel::Validations::AtLeastOnePresentValidator
class ActiveModel::Validations::AtLeastOnePresentValidator

  class TestModel < Struct.new(:home_phone, :work_phone)
    include ActiveModel::Validations

    validates_with AtLeastOnePresentValidator, at_least_one_of: [:home_phone, :work_phone]
  end

  describe TestModel do

    context 'when we supply none of the required fields' do
      before { subject.valid? }
      its('errors.messages') { should == {base: ["at least 1 of these fields must be present: home_phone or work_phone"]} }
    end

    context 'when we only have home_phone' do
      before { subject.home_phone = '555-555-5555' }
      before { subject.valid? }
      its('errors.messages') { should == {} }
    end

  end

end
