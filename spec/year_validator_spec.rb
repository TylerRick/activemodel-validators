require 'spec_helper'

      ActiveModel::Validations::YearValidator
class ActiveModel::Validations::YearValidator

  class TestModel < Struct.new(:graduation_year, :ancient_person_birth_year)
    include ActiveModel::Validations

    validates :graduation_year, year: true
    validates :ancient_person_birth_year, year: {min: 1000, max: 2000}
  end

  describe TestModel do

    it { should_not allow_value(1699).for(:graduation_year).with_message('is not a valid year (must be a number between 1700 and 2200)') }
    it { should     allow_value(1700).for(:graduation_year) }
    it { should     allow_value(2200).for(:graduation_year) }
    it { should_not allow_value(2201).for(:graduation_year).with_message('is not a valid year (must be a number between 1700 and 2200)') }

    it { should_not allow_value( 999).for(:ancient_person_birth_year).with_message('is not a valid year (must be a number between 1000 and 2000)') }
    it { should     allow_value(1000).for(:ancient_person_birth_year) }
    it { should     allow_value(2000).for(:ancient_person_birth_year) }
    it { should_not allow_value(2001).for(:ancient_person_birth_year).with_message('is not a valid year (must be a number between 1000 and 2000)') }

  end

end

