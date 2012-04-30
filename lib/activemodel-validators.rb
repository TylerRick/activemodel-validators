require "active_model"
require "activemodel-validators/version"
require "activemodel-validators/rails"

module ActiveModel
  module Validations
    autoload :GreaterThanValidator       , 'activemodel-validators/greater_than_validator'
    autoload :LessOrGreaterThanValidator , 'activemodel-validators/less_or_greater_than_validator'
    autoload :LessThanValidator          , 'activemodel-validators/less_than_validator'

    autoload :BooleanPresenceValidator   , 'activemodel-validators/boolean_presence_validator'
    autoload :RestrictToValidator        , 'activemodel-validators/restrict_to_validator'
    autoload :AtLeastOnePresentValidator , 'activemodel-validators/at_least_one_present_validator'
    autoload :BlankValidator             , 'activemodel-validators/blank_validator'
    autoload :MultipleOfValidator        , 'activemodel-validators/multiple_of_validator'
    autoload :SumOfValidator             , 'activemodel-validators/sum_of_validator'

    autoload :DateValidator              , 'activemodel-validators/date_validator'
    autoload :YearValidator              , 'activemodel-validators/year_validator'

    autoload :PhoneValidator             , 'activemodel-validators/phone_validator'
    autoload :PostalCodeValidator        , 'activemodel-validators/postal_code_validator'
    autoload :AddressStateValidator      , 'activemodel-validators/address_state_validator'
  end
end
