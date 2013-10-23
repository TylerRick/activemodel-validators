ActiveRecord::Migration.create_table :users do |t|
  t.date :optional_date
  t.date :end_date
  t.date :custom_format_date
end

class User < ActiveRecord::Base
  validates :optional_date, date: true
  validates :custom_format_date, date: {expected_format: 'dd/mm/yyyy'}
  validates :end_date, date: {required: true}
end
