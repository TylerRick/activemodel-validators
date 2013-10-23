ActiveRecord::Migration.create_table :users do |t|
  t.date :optional_date
  t.date :end_date
end

class User < ActiveRecord::Base
  validates :optional_date, date: true
  validates :end_date, date: {required: true}
end
