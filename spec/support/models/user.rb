class User < Struct.new(:name, :age)
  include ActiveModel::Validations
end
