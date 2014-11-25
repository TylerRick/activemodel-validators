require 'spec_helper'

      ActiveModel::Validations::SumOfValidator
class ActiveModel::Validations::SumOfValidator

  class TestModel < Struct.new(:group_1_count, :group_2_count, :total_count)
    include ActiveModel::Validations

    validates :total_count, sum_of: {attr_names: [:group_1_count, :group_2_count] }
  end

  describe TestModel do
    before { subject.group_1_count = 1 }
    before { subject.group_2_count = 2 }
    before { subject.total_count   = 3 }

    context 'when group_1_count + group_2_count == total_count' do
      before { subject.valid? }
      its('errors.messages') { should == {} }
    end

    context 'when group_1_count + group_2_count != total_count' do
      before { subject.group_2_count = 1 }
      before { subject.valid? }
      its('errors.messages') { should == {total_count: ["must be the sum of group_1_count and group_2_count (2) but was 3"]} }
    end

    context 'when total_count is blank' do
      before { subject.total_count = '' }
      before { subject.valid? }
      its('errors.messages') { should == {} }
    end

    context 'when group_1_count and group_2_count are blank' do
      before { subject.group_1_count = nil }
      before { subject.group_2_count = '' }
      before { subject.valid? }
      its('errors.messages') { should == {total_count: ["must be the sum of group_1_count and group_2_count (0) but was 3"]} }
    end

    context 'when group_2_count is blank' do
      before { subject.group_2_count = '' }
      before { subject.valid? }
      its('errors.messages') { should == {total_count: ["must be the sum of group_1_count and group_2_count (1) but was 3"]} }
    end

    context 'when group_1_count is a string and group_2_count is a fixnum' do
      before { subject.group_1_count = '1' }
      before { subject.group_2_count =  2 }
      it { expect { subject.valid? }.to raise_exception 'no implicit conversion of Fixnum into String' }
    end

    context 'when group_1_count is a fixnum and group_2_count is a string' do
      before { subject.group_1_count =  1 }
      before { subject.group_2_count = '2' }
      it { expect { subject.valid? }.to raise_exception "String can't be coerced into Fixnum" }
    end

  end

end
