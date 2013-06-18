class WordExample < ActiveRecord::Base
  belongs_to    :word
  belongs_to    :author
end