require 'active_record'

ActiveRecord::Schema.define do
  self.verbose = true

  enable_extension "plpgsql"
  enable_extension "pgcrypto"

  create_table(:authors, force: true) do |t|
    t.string :name, null: false
  end

  create_table(:books, force: true) do |t|
    t.string :title
    t.string :isbn
  end
end
