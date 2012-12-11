class Response < Struct.new(:how_many_people, :how_many_pies)
  #extend  ActiveModel::Naming
  #include ActiveModel::Conversion
  include ActiveModel::Validations

  validates :how_many_people, greater_than: { value: 1, operator: :>= }, allow_blank: true
  validates :how_many_pies,   at_least:     { value: 1 },                allow_blank: true
end
