class Author < ActiveRecord::Base
  has_many :definitions
  has_many :requests
  has_many :tags
  has_many :words
end