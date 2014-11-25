require 'spec_helper'

      ActiveModel::Validations::SumOfValidator
class ActiveModel::Validations::SumOfValidator

  class TestModel < Struct.new(:group_1_count, :group_2_count, :total_count)
    include ActiveModel::Validations

    validates :total_count, sum_of: {attr_names: [:group_1_count, :group_2_count] }
  end

  describe TestModel do
    before { subject.group_1_count = 5 }
    before { subject.group_2_count = 4 }
    before { subject.total_count   = 9 }

    context 'when group_1_count + group_2_count == total_count' do
      before { subject.valid? }
      its('errors.messages') { should == {} }
    end

    context 'when group_1_count + group_2_count != total_count' do
      before { subject.group_2_count = 1 }
      before { subject.valid? }
      its('errors.messages') { should == {total_count: ["must be the sum of group_1_count and group_2_count (6) but was 9"]} }
    end

    context 'when total_count is blank' do
      before { subject.total_count = '' }
      before { subject.valid? }
      its('errors.messages') { should == {} }
    end

    context 'when group_2_count is blank' do
      before { subject.group_2_count = '' }
      before { subject.valid? }
      its('errors.messages') { should == {} }
    end

  end

end
