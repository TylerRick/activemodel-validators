ActiveModel Validators
=======================

A collection of Rails 3 ActiveModel Validators

Example Usage
-------------

```ruby
class Thing < ActiveRecord::Base
  validates :birthdate, greater_than: { value: Date.new(1900), message: 'must be later than 1900' }
  validates :birthdate, less_than:    { value: Time.zone.now.years_ago(1).to_date+1, message: 'must be at least 1 year ago' }
  validates :end_date,  greater_than: {attr: :begin_date, operator_text: 'later than'}

  # shortcut for        greater_than: { value: 1, operator: :>=, operator_text: 'at least' }
  validates :how_many_pies, at_least: { value: 1 }

  # Because presence: true doesn't work for boolean attributes!
  validates :is_18_or_older, boolean_presence: true

  validates :model,  restrict_to: {allowed_options: ['Model A', 'Model B']}, allow_blank: true

  validates_with AtLeastOnePresentValidator, at_least_one_of: [:parent_1_home_phone, :parent_1_work_phone, :parent_1_mobile_phone], message: :at_least_one_phone_parent_1

  validates :option_b, blank: {message: :must_be_blank_if_option_a}, if: :option_a?

  validates :rating, multiple_of: {of: '0.5'}

  validates :total_profit, sum_of: { attr_names: (1..4).map {|quarter| :"total_profit_q#{quarter}" } }

  validates :end_date, date: {required: true}
  validates :graduation_year,       year: true

  validates :phone,                 phone: true
  validates :address_postal_code,   postal_code: true
  validates :address_state,         address_state: true
end
```

Documentation
-------------

* [GreaterThanValidator](activemodel-validators/blob/master/lib/activemodel-validators/greater_than_validator.rb)
* [LessOrGreaterThanValidator](activemodel-validators/blob/master/lib/activemodel-validators/less_or_greater_than_validator.rb)
* [LessThanValidator](activemodel-validators/blob/master/lib/activemodel-validators/less_than_validator.rb)
* [AtLeastValidator](activemodel-validators/blob/master/lib/activemodel-validators/at_least_validator.rb)

* [BooleanPresenceValidator](activemodel-validators/blob/master/lib/activemodel-validators/boolean_presence_validator.rb)
* [RestrictToValidator](activemodel-validators/blob/master/lib/activemodel-validators/restrict_to_validator.rb)
* [AtLeastOnePresentValidator](activemodel-validators/blob/master/lib/activemodel-validators/at_least_one_present_validator.rb)
* [BlankValidator](activemodel-validators/blob/master/lib/activemodel-validators/blank_validator.rb)
* [MultipleOfValidator](activemodel-validators/blob/master/lib/activemodel-validators/multiple_of_validator.rb)
* [SumOfValidator](activemodel-validators/blob/master/lib/activemodel-validators/sum_of_validator.rb)

* [DateValidator](activemodel-validators/blob/master/lib/activemodel-validators/date_validator.rb)
* [YearValidator](activemodel-validators/blob/master/lib/activemodel-validators/year_validator.rb)

* [PhoneValidator](activemodel-validators/blob/master/lib/activemodel-validators/phone_validator.rb)
* [PostalCodeValidator](activemodel-validators/blob/master/lib/activemodel-validators/postal_code_validator.rb)
* [AddressStateValidator](activemodel-validators/blob/master/lib/activemodel-validators/address_state_validator.rb)

Installation
============

Add to your Gemfile :

```ruby
gem 'activemodel-validators'
```


Comparison to other validation gems/collections
===============================================

I like this idea from https://github.com/fnando/validators:

```ruby
    class Server < ActiveRecord::Base
      validates_datetime :starts_at
      validates_datetime :ends_at, :after => :starts_at, :if => :starts_at?
      validates_datetime :ends_at, :after => :now
      validates_datetime :ends_at, :before => :today

      validates :starts_at, :datetime => true
    end
```

Other collections worth taking a look at:
-----------------------------------------------

* https://github.com/e-travel/evelpidon_validators
    * Different
    * Less
    * More
    * Associated
    * Credit Card
* https://github.com/cesario/activevalidators
    * :postal_code => { :country => :us }
    * :phone => true
    * :password => { :strength => :medium }
* https://github.com/fnando/validators
* https://github.com/jeremiahishere/format_validators
    * :phone_format => true
    * Days of the Week

Other collections not worth taking a look at:
-----------------------------------------------

* https://github.com/willian/rails_validators
* https://github.com/infosimples/more_validators
* https://github.com/aurels/extra_validators

Specialized validators that stand on their own:
-----------------------------------------------

* https://github.com/balexand/email_validator 


To do
=====

* Write actual documentation
* Add tests
* Merge into/with an other existing gem


License
=======

Copyright 2012, Tyler Rick

This is free software, distributed under the terms of the MIT License.
