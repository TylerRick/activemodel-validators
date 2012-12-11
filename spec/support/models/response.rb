class Response < Struct.new(:how_many_people)
  #extend  ActiveModel::Naming
  #include ActiveModel::Conversion
  include ActiveModel::Validations

  validates :how_many_people,
            greater_than: { value: 1, operator: :>= }, allow_blank: true

end
