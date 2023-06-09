require 'active_record'
require_relative './connection.rb'
require_relative './schema.rb'

class Author < ActiveRecord::Base
  has_many :books, through: :authorships
  has_many :authorships

  validates :name, presence: true

  before_save :capitalize_name

  private

  def capitalize_name
    self.name = self.name.capitalize
  end
end

class Book < ActiveRecord::Base
  has_many :authors, through: :authorships
  has_many :authorships

  validates :title, presence: true
  validates :isbn, uniqueness: true

  before_save :format_title

  private

  def format_title
    self.title = self.title.titleize
  end
end

class Authorship < ActiveRecord::Base
  belongs_to :author
  belongs_to :book

  validates :author_id, presence: true
  validates :book_id, presence: true
end

