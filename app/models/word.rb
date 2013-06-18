class Word < ActiveRecord::Base
  belongs_to    :author
  has_many      :tags
  has_many      :definitions
  has_many      :word_examples
  has_many      :images
  has_many      :offences
  has_many      :origins
end