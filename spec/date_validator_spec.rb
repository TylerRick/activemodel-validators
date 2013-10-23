require 'spec_helper'

describe ::User, 'ActiveModel::Validations::DateValidator' do

  shared_examples_for 'should not allow invalid dates' do |attr_name: nil|
    message = "is not a valid date (must be in dd/mm/yyyy format)"
    it { should_not allow_value('non-date').  for(attr_name).with_message(message) }
    it { should     allow_value('2013-01-01').for(attr_name) }
    it { should     allow_value('30/12/2013').for(attr_name) }
  end

  describe 'date: true' do
    it { should     allow_value(nil).for(:optional_date) }
    it { should     allow_value(''). for(:optional_date) }
    it_behaves_like 'should not allow invalid dates', attr_name: :optional_date
  end

  describe 'date: {required: true}' do
    it { should_not allow_value(nil).for(:end_date).with_message("can't be blank") }
    it { should_not allow_value(''). for(:end_date).with_message("can't be blank") }
    it_behaves_like 'should not allow invalid dates', attr_name: :end_date
  end

end
